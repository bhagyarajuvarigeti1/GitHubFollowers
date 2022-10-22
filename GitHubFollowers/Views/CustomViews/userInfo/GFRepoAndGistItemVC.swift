//
//  GFRepoAndGistItemVC.swift
//  GitHubFollowers
//
//  Created by mac on 22/10/22.
//

import UIKit

class GFRepoAndGistInfoItemVC: GFParentItemViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    func configureItems() {
        itemLabelOne.set(itemInfoType: .repos, count: user.publicRepos)
        itemLabelTwo.set(itemInfoType: .gists, count: user.publicGists)
        button.setColourAndTitle(backGroundColor: .systemPurple, title: "GitHub Profile")
        
    }
    
}
