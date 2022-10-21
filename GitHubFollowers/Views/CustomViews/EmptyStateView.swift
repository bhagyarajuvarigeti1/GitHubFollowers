//
//  EmptyStateView.swift
//  GitHubFollowers
//
//  Created by mac on 21/10/22.
//

import Foundation
import UIKit

class EmptyStateView: UIView {
    
    let emptyMessageLabel   = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let imageView           = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        emptyMessageLabel.text = message
        imageView.image = UIImage(named : "empty-state-logo" )
        configure()
    }
    
    func configure() {
        addSubview(emptyMessageLabel)
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        emptyMessageLabel.numberOfLines = 2
        emptyMessageLabel.textColor     = .systemGray3
        
        NSLayoutConstraint.activate([
            emptyMessageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyMessageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200),
            emptyMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            emptyMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -50),
            
            imageView.topAnchor.constraint(equalTo: emptyMessageLabel.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
//            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
