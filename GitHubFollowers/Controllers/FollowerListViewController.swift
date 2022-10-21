//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by mac on 19/10/22.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    enum Section {
        case main
    }

    var userName: String!
    var page = 1
    var hasMoreFollower = true
    var isSearching = false
    var collectionView: UICollectionView!
    var followers = [Follower]()
    var filterFollowers = [Follower]()
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureSearchController()
        configureCollecitonView()
        getFollowers(username: userName, page: page)
        configureDataSource()
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    func configureCollecitonView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: UIHelper().createThreeColumnFlowLayout(view: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.register(FollowersCell.self, forCellWithReuseIdentifier: FollowersCell.reuseId)
    }

    func getFollowers(username: String, page: Int) {
        showLoadingView()
        NetworkManager.shared.getFollowers(for: userName, page: page) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let followers):
                if followers.count < 15 { self.hasMoreFollower.toggle() }
                if followers.isEmpty {
                    let message = "This user doesn't have any followers. Go follow 😃. "
                    DispatchQueue.main.async {
                        self.showEmptyStateView(message: message, view: self.view)
                    }
                    
                }
                self.followers.append(contentsOf: followers)
                self.updateData(followers: self.followers)
            case .failure(let error):
                self.presentAlertOnMainThread(title: "Bad Stuff", message: error.rawValue, buttonTitle: "Ok")
            }
        }
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowersCell.reuseId, for: indexPath) as! FollowersCell
            cell.set(follower: follower)
            cell.layer.borderColor = UIColor.red.cgColor
            cell.layer.borderWidth = 1
            return cell
            
        })
    }
    
    func updateData(followers: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        }
    }
}


extension FollowerListViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollower else { return }
            page += 1
            getFollowers(username: userName, page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray     = isSearching ? filterFollowers: followers
        let follower        = activeArray[indexPath.row]
        let userInfoVC      = UserInfoViewController()
        let userInfoNC      = UINavigationController(rootViewController: userInfoVC)
        userInfoVC.userName = follower.login
        present(userInfoNC, animated: true)
    }
}

extension FollowerListViewController: UISearchBarDelegate, UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else { return }
        isSearching = true
        filterFollowers = followers.filter { $0.login.lowercased().contains(text.lowercased())}
        updateData(followers: filterFollowers)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        updateData(followers: followers)
        isSearching = false
    }
}
