//
//  FeedDataModel.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/03.
//

import UIKit

struct FeedDataModel {
    let profileName: String
    var profileImage: UIImage? {
        return UIImage(named: profileName)
    }
    let feedImageName: String
    var feedImage: UIImage? {
        return UIImage(named: feedImageName)
    }
    
    let likeNum: Int
    var likeInfo: String {
        return "좋아요 \(likeNum)개"
    }
    
    let feedSummary: String
    var commentNum: Int
    var commentInfo: String {
        return "댓글 \(commentNum)개 모두 보기"
    }
}

extension FeedDataModel {
    static let sampleData: [FeedDataModel] = [
        FeedDataModel(profileName: "avatar1", feedImageName: "postImage1", likeNum: 30, feedSummary: "기회는 일어나는 것이 아니라 만들어내는 것이다.", commentNum: 19),
        FeedDataModel(profileName: "avatar2", feedImageName: "postImage2", likeNum: 330, feedSummary: "큰 목표를 이루고 싶으면 허락을 구하지 마라.", commentNum: 24),
        FeedDataModel(profileName: "avatar3", feedImageName: "postImage3", likeNum: 130, feedSummary: "늘 하던 대로 하면 늘 얻던 것을 얻는다.", commentNum: 110),
        FeedDataModel(profileName: "avatar4", feedImageName: "postImage4", likeNum: 30, feedSummary: "놀러 가고 싶다", commentNum: 199),
    ]
}
