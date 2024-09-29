//
//  Date+Extensions.swift
//  GHFollowers
//
//  Created by Muhammad Shayan on 29/09/2024.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }

}
