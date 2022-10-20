//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by mac on 18/10/22.
//

import UIKit

class SearchViewController: UIViewController {

    let logoImageView = UIImageView()
    let userNameTextField = GFUITextField()
    let callToActionButton = GFUIButton(backGroundColor: .systemGreen, title: "Search")
    
    var isUsernameEntered: Bool {
        return userNameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureLogoImageView()
        createDismissKeyBoard()
        userNameTextField.text = "github"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func pushFollowersListViewController() {
        
        guard !isUsernameEntered else {
            presentAlertOnMainThread(title: "Empty username",
                                     message: "Please enter username. we need to know who to look for 😀.",
                                     buttonTitle: "OK")
            return
        }
        
        let followerlistvc      = FollowerListViewController()
        followerlistvc.userName = userNameTextField.text
        followerlistvc.title    = userNameTextField.text
        
        navigationController?.pushViewController(followerlistvc, animated: true)
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo:  view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant:  200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        configureUserNameTextField()
    }
    
    func configureUserNameTextField() {
        view.addSubview(userNameTextField)
        userNameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        configureCallToActionButton()
    }
    
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowersListViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 52)
        ])
        
    }
    
    func createDismissKeyBoard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        // to resign first responder "endediting"
        view.addGestureRecognizer(tap)
    }
}

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
}
