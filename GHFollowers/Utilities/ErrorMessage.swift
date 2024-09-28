//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Muhammad Shayan on 23/08/2024.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request."
    case unableToComplete = "Unable to complete request. Please check your internet."
    case invalidResponse = "The response received from server is invalid."
    case invalidData = "The data received from server is invalid."
}
