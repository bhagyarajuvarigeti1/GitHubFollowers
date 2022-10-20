//
//  Followers.swift
//  GitHubFollowers
//
//  Created by mac on 19/10/22.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
