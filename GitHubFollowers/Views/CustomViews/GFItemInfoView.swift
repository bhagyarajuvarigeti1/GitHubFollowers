//
//  GFItemInfoView.swift
//  GitHubFollowers
//
//  Created by mac on 22/10/22.
//

import UIKit

enum ItemInfoTypes {
    case repos, gists, follower, following    
}

class GFItemInfoView: UIView {

    let symbolImageView = UIImageView()
    let titleLabel      = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel      = GFTitleLabel(textAlignment: .center, fontSize: 14)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(symbolImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolImageView.contentMode  = .scaleAspectFill
        symbolImageView.tintColor    = .systemBlue
        let padding: CGFloat         = 20
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            symbolImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            symbolImageView.topAnchor.constraint(equalTo: topAnchor),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
            
        ])
    }
    
    func set(itemInfoType: ItemInfoTypes, count: Int)
    {
        switch itemInfoType {
        case .repos:
            symbolImageView.image   = UIImage(systemName: Constants.repos)
            titleLabel.text         = Constants.publicRepos
            
        case .gists:
            symbolImageView.image   = UIImage(systemName: Constants.gists)
            titleLabel.text         = Constants.publicGists
        case .follower:
            symbolImageView.image   = UIImage(systemName: Constants.followers)
            titleLabel.text         = Constants.followersstr

        case .following:
            symbolImageView.image   = UIImage(systemName: Constants.following)
            titleLabel.text         = Constants.followingstr

        }
        
        countLabel.text = "\(count)"
    }

}
