//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by mac on 19/10/22.
//

import Foundation

enum ErrorMessage: String {
    
    case invalidUsername    =  "This username created an invalid request. Please try again. "
    
    case unableToComplie    = "unable to complete your request. please check your Internet "
    
    case invalidResponse    = "Invalid response from the server. Please try again"
    
    case invalidData       = "The data receiver from the server was invalid. Please try again "
}
