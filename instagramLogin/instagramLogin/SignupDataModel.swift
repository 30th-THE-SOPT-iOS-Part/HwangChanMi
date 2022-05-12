//
//  SignUpDataModel.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/12.
//

import Foundation

struct SignUpResponse: Codable {
    let status: Int
    let success: Bool?
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let name: String
    let email: String
    let password: String
}
