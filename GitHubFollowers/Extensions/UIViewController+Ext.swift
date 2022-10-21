//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by mac on 19/10/22.
//

import UIKit

fileprivate var containerView: UIView!

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
    
    func showLoadingView() {
        containerView  = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor   = .systemBackground
        containerView.alpha             = 0
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndidcator = UIActivityIndicatorView(style: .large)
        containerView.addSubview( activityIndidcator)
        activityIndidcator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndidcator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndidcator.centerYAnchor.constraint(equalTo:  view.centerYAnchor)
        ])
        
        activityIndidcator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyStateView(message: String,view: UIView) {
        
        let emptyStateView = EmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
        
    }
}
