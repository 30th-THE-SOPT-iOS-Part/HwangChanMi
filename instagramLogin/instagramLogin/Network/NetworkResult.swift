//
//  NetworkResult.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/12.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
