//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by mac on 19/10/22.
//

import UIKit

extension UIViewController {
    
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alert = GFAlertViewController(title: title,
                                              message: message,
                                              buttonTitle: buttonTitle)
            
            alert.modalPresentationStyle    = .overFullScreen
            alert.modalTransitionStyle      = .crossDissolve
            
            self.present(alert, animated: true)
        }
        
        
    }
    
}
