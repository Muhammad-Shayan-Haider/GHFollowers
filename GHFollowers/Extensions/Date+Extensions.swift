//
//  Date+Extensions.swift
//  GHFollowers
//
//  Created by Muhammad Shayan on 29/09/2024.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.month().year())
    }
}
