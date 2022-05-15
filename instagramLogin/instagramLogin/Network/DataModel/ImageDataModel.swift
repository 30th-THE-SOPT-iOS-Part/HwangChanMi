//
//  ImageDataModel.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/14.
//

import Foundation

typealias ImageData = [ImageResponse]

struct ImageResponse: Codable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
}
