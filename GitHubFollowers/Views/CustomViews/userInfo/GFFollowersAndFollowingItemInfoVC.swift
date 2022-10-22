//
//  GFFollowersAndFollowingItemInfoVC.swift
//  GitHubFollowers
//
//  Created by mac on 22/10/22.
//

import UIKit

class GFFollowersAndFollowingItemInfoVC: GFParentItemViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    func configureItems() {
        itemLabelOne.set(itemInfoType: .following, count: user.following)
        itemLabelTwo.set(itemInfoType: .follower, count: user.followers)
        button.setColourAndTitle(backGroundColor: .systemGreen, title: "GitHub Followers")
    }
}
