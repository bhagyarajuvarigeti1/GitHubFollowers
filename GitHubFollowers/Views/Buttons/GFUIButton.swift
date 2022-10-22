//
//  GFUIButton.swift
//  GitHubFollowers
//
//  Created by mac on 18/10/22.
//

import UIKit

class GFUIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backGroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = backGroundColor
        
        self.setTitle(title, for: .normal)
        
        configure()
    }
    
    private func configure() {
        layer.cornerRadius      = 10
        titleLabel?.textColor   = .white
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setColourAndTitle(backGroundColor: UIColor, title: String ) {
        self.backgroundColor = backGroundColor
        
        self.setTitle(title, for: .normal)
    }

}
