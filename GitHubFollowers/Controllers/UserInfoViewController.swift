//
//  UserInfoViewController.swift
//  GitHubFollowers
//
//  Created by mac on 21/10/22.
//

import UIKit

protocol UserInfoViewControllerDelegate {
    
    func showSafariViewController(user: User)
//
}

class UserInfoViewController: UIViewController {
    
    let headerView  = UIView()
    let ItemViewOne = UIView()
    let ItemViewTwo = UIView()
    let dateLable   = GFBodyLabel(textAlignment: .center)
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        
        getUser(userName: userName ?? "")
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        configureHeaderView()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        
    }
    
    func getUser(userName: String) {
        NetworkManager.shared.getUserInfo(for: userName) { result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.addChildVCs(user: user)
                }
            case .failure(let error):
                self.presentAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    func addChildVCs(user: User){
        self.add(childVC: GFUserInfoHeaderViewController(user: user), to: self.headerView)
        self.add(childVC: GFRepoAndGistInfoItemVC(user: user), to: self.ItemViewOne)
        self.add(childVC: GFFollowersAndFollowingItemInfoVC(user: user), to: self.ItemViewTwo)
        self.dateLable.text = "user.createdAt.convertDateToDisplayFormate())"
    }
    
    func configureHeaderView() {
        let padding: CGFloat = 20
        let views = [headerView, ItemViewOne, ItemViewTwo,dateLable]
        for itemView in views {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            
            ItemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            ItemViewOne.heightAnchor.constraint(equalToConstant: 150),
            
            ItemViewTwo.topAnchor.constraint(equalTo: ItemViewOne.bottomAnchor, constant: padding),
            ItemViewTwo.heightAnchor.constraint(equalToConstant: 150),
            
            dateLable.topAnchor.constraint(equalTo: ItemViewTwo.bottomAnchor, constant: padding),
            dateLable.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
//        childVC.didMove(toParent: self)
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
