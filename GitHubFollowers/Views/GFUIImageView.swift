//
//  GFUIView.swift
//  GitHubFollowers
//
//  Created by mac on 20/10/22.
//

import UIKit

class GFUIImageView: UIImageView {

    let placeHolderImage = UIImage(named: "avatar-placeholder")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        layer.cornerRadius  = 10
        clipsToBounds       = true
        image               = self.placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}
