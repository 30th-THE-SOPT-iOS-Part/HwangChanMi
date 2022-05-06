//
//  StoryDataModel.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/04.
//

import Foundation
import UIKit

struct StoryDataModel {
    
    let profileName: String
    var profileImage: UIImage? {
        return UIImage(named: profileName)
    }
}

extension StoryDataModel {
    static let sampleData: [StoryDataModel] = [
    StoryDataModel(profileName: "Frame 30"),
    StoryDataModel(profileName: "Frame 31"),
    StoryDataModel(profileName: "Frame 32"),
    StoryDataModel(profileName: "Frame 33"),
    StoryDataModel(profileName: "Frame 34"),
    StoryDataModel(profileName: "Frame 35")]
}
