//
//  Date+EXt.swift
//  GitHubFollowers
//
//  Created by mac on 22/10/22.
//

import Foundation

extension Date {
    func convertDateMonthAndYear() -> String{
        let dateForemater = DateFormatter()
        dateForemater.dateFormat = "MMM YYYY"
        return dateForemater.string(from: self)
    }
}
