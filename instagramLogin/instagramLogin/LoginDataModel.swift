//
//  LoginDataModel.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/12.
//

import Foundation

struct LoginResponse: Codable {
    let status: Int
    let success: Bool?
    let meessage: String
    let data: LoginData?
}

struct LoginData: Codable {
    let name: String
}
