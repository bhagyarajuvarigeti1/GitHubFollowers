//
//  UserInfoViewController.swift
//  GitHubFollowers
//
//  Created by mac on 21/10/22.
//

import UIKit

class UserInfoViewController: UIViewController {

    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        title                             = userName
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
