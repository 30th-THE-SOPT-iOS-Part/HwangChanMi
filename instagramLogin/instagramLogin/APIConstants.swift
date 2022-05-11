//
//  APIConstants.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/12.
//

import Foundation

struct APIConstants {
    // Base URL
    static let baseURL = "http://13.124.62.236"
    
    // Feature URL
    // login URL = "http://13.124.62.236/auth/signin"
    static let loginURL = baseURL + "/auth/signin"
    
    // signup URL = "http://13.124.62.236/auth/signup"
    static let signupURL = baseURL + "/auth/signup"
}
