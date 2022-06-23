//
//  StoryCollectionViewCell.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/04.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var profileImg: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setStoryData(_ storyData: StoryDataModel) {
        profileImg.image = storyData.profileImage
    }
}
