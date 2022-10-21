//
//  CollectionViewCell.swift
//  GitHubFollowers
//
//  Created by mac on 20/10/22.
//

import UIKit

class FollowersCell: UICollectionViewCell {
    
    static let reuseId  = "FollowersCell"
    let avatarImageView = GFUIImageView(frame: .zero)
    let userNamelabel   = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        userNamelabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }
    
    func configure() {
        addSubview(avatarImageView)
        addSubview(userNamelabel)
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 10
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
        
            userNamelabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            userNamelabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            userNamelabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            userNamelabel.heightAnchor.constraint(equalToConstant: 20),

        ])
    }
}
