//
//  StoryTableViewCell.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/05.
//

import UIKit

class StoryTableViewCell: UITableViewCell, UICollectionViewDataSource {
    
    static let identifier = "StoryTableViewCell"

    @IBOutlet weak var StoryCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollection()
    }
    
    private func setCollection() {
        let nib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        StoryCollectionView.register(nib, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        
        StoryCollectionView.dataSource = self
        StoryCollectionView.delegate = self
    }
    
    // 몇 개의 데이터를 보여 줄 것인지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoryDataModel.sampleData.count
    }
    
    // 데이터를 어떻게 보여 줄 것인지
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = StoryCollectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setData(StoryDataModel.sampleData[indexPath.row])
        
        return cell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension StoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (58/375)
        let cellHeight = cellWidth * (72/58)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 6, bottom: 8, right: 6)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }

}
