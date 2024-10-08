//
//  GFUITextField.swift
//  GitHubFollowers
//
//  Created by mac on 18/10/22.
//

import UIKit

class GFUITextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius  = 10
        layer.borderWidth   = 2
        layer.borderColor   = UIColor.systemGray4.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor                   = .label
        tintColor                   = .label
        textAlignment               = .center
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        autocapitalizationType      = .none
        backgroundColor         = .tertiarySystemBackground
        autocorrectionType      = .no
        returnKeyType           = .go
        placeholder             = "Enter the username"
    }

}
