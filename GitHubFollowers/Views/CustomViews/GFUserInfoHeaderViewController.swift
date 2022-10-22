//
//  GFUserInfoHeaderViewController.swift
//  GitHubFollowers
//
//  Created by mac on 21/10/22.
//

import UIKit

class GFUserInfoHeaderViewController: UIViewController {

    let avatarImageView     = GFUIImageView(frame: .zero)
    let usernameLabel       = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel           = GFSecondaryLabel(fontSize: 18)
    let locationImageView   = UIImageView()
    let locationLabel       = GFSecondaryLabel(fontSize: 18)
    let bioLabel            = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        assignValues()
    }
    
    func assignValues() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text     = user.name
        locationLabel.text = user.location != "" ? user.login : "NA"
        locationImageView.image = UIImage(systemName: "mappin.and.ellipse")
        bioLabel.text = user.bio
    }
    
    func configure() {
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
        
        
        let padding: CGFloat            = 20
        let ImageViewPadding: CGFloat   = 12
        
        bioLabel.numberOfLines = 3
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.trailingAnchor.constraint(equalTo:  view.trailingAnchor, constant: -padding),
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  padding),
            usernameLabel.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            locationImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            locationImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant:  5),
            locationImageView.heightAnchor.constraint(equalToConstant: 24),
            locationImageView.widthAnchor.constraint(equalToConstant: 24),
            
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 10),
            locationLabel.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant:  -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 24),
//            locationLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            
            bioLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant:  padding)
            
        ])
        
    }
    


}
