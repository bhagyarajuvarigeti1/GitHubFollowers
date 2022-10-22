//
//  String+Ext.swift
//  GitHubFollowers
//
//  Created by mac on 22/10/22.
//

import Foundation

extension String {
    
    func convertStringToDate() -> Date? {
        let dateFormater        = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormater.locale     = Locale(identifier: "or_IN")
        dateFormater.timeZone   = .current
        let date                = dateFormater.date(from: self)
        return date
    }
    
    func convertDateToDisplayFormate() -> String {
        guard let date = self.convertStringToDate() else { return "NA" }
        return date.convertDateMonthAndYear()
    }
}
