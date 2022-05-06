//
//  FeedTableViewCell.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/03.
//

import UIKit

protocol TableViewCellDelegate {
    func likeBtnDidTapEvent(_ msg: String)
}

class FeedTableViewCell: UITableViewCell {
    
    // Cell을 구분하기 위한 Identifier
    static let identifier = "FeedTableViewCell"

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var feedImg: UIImageView!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var FeedLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    var delegate: UITableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBtn()
    }
    
    private func setBtn() {
        likeBtn.setImage(Const.Icon.unlike, for: .normal)
        likeBtn.setImage(Const.Icon.like, for: .selected)
    }
    
//    @IBAction func likeBtnDidTap(_ sender: UIButton) {
//        sender.isSelected.toggle()
//        delegate?.likeBtnDidTapEvent(likeLabel.text ?? "")
//    }
    
    func setData(_ feedData: FeedDataModel) {
        profileImg.image = feedData.profileImage
        profileName.text = feedData.profileName
        feedImg.image = feedData.feedImage
        likeLabel.text = feedData.likeInfo
        nameLabel.text = feedData.profileName
        FeedLabel.text = feedData.feedSummary
        commentLabel.text = feedData.commentInfo
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}