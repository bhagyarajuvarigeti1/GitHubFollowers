//
//  GFBodyLabel.swift
//  GitHubFollowers
//
//  Created by mac on 19/10/22.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        
        configure()
    }
    
    private func configure() {
        textColor                   = .secondaryLabel
        font                        = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.9
        lineBreakMode               = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}
