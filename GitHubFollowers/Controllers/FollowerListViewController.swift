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
    var collectionView: UICollectionView!
    var followers = [Follower]()
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureCollecitonView()
        getFollowers()
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
    
    func configureCollecitonView() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createThreeColumnFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.register(FollowersCell.self, forCellWithReuseIdentifier: FollowersCell.reuseId)
    }
    
    func createThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        print(width)
        let padding: CGFloat            = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth              = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth                   = availableWidth / 3
        print(itemWidth)
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    
    
    func getFollowers() {
        NetworkManager.shared.getFollowers(for: userName, page: 1) { followers, errorMessage in
            guard let followers = followers else {
                self.presentAlertOnMainThread(title: "Bad request", message: errorMessage!.rawValue, buttonTitle: "OK")
                return
            }

            print("Followers.count = \(followers.count)")
            print(followers)
            self.followers = followers
            self.updateData()
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
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        }
        
    }
}
