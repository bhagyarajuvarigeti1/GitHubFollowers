//
//  FollowerListViewController.swift
//  GitHubFollowers
//
//  Created by mac on 19/10/22.
//

import UIKit

class FollowerListViewController: UIViewController {

    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
