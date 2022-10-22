//
//  GFParentItemViewController.swift
//  GitHubFollowers
//
//  Created by mac on 22/10/22.
//

import UIKit

class GFParentItemViewController: UIViewController {
    
    let stackView       = UIStackView()
    let itemLabelOne    = GFItemInfoView()
    let itemLabelTwo    = GFItemInfoView()
    let button          = GFUIButton()
    
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
        configureBackgroudView()
        
        layOutUI()
        configureStackView()
    }
    
    private func configureBackgroudView() {
        view.backgroundColor    = .secondarySystemBackground
        view.layer.cornerRadius = 18
    }
    
    private func configureStackView() {
        
        stackView.axis          = .horizontal
        stackView.distribution  = .fillEqually
        
        stackView.addArrangedSubview(itemLabelOne)
        stackView.addArrangedSubview(itemLabelTwo)
    }
    
    private func layOutUI() {
        view.addSubview(stackView)
        view.addSubview(button)
//        stackView.backgroundColor = .red
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat  = 20
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            button.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}
