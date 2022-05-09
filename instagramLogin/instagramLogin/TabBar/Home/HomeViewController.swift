//
//  HomeViewController.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/04/19.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var addUIButton: UIButton!
    @IBOutlet weak var likeUIButton: UIButton!
    @IBOutlet weak var shareUIButton: UIButton!
    
    @IBOutlet weak var feedTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        feedTableView.register(nib, forCellReuseIdentifier: FeedTableViewCell.identifier)

        let storyNib = UINib(nibName: StoryTableViewCell.identifier, bundle: nil)
        feedTableView.register(storyNib, forCellReuseIdentifier: StoryTableViewCell.identifier)
        
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
    @IBAction func addBtnDidTap(_ sender: Any) {
    }
    @IBAction func likeBtnDidTap(_ sender: Any) {
    }
    @IBAction func shareBtnDidTap(_ sender: Any) {
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 72
        case 1:
            return 488
        default:
            return 0
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    
    // 몇 개의 tableView를 보여 줄 것인지
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 각 section마다 cell 다르게
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int
        
        switch section {
        case 0:
            count = 1
        case 1:
            count = FeedDataModel.sampleData.count
        default:
            count = 0
        }
        return count
    }
    
    // cell을 어떻게 보여 줄 것인지?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier, for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as?
                    FeedTableViewCell else { return UITableViewCell() }
            
            cell.setData(FeedDataModel.sampleData[indexPath.row])
            cell.delegate = self
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

//extension HomeViewController :FeedTableViewCellDelegate {
//    func likeButtonClicked(index:Int) {
//        let alert = UIAlertController(title: "하트", message: "\(index)번 글 하트 버튼 클릭", preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "확인", style: .default, handler: { _ in })
//
//        alert.addAction(okAction)
//
//        self.present(alert, animated: true, completion: nil)
//    }
//}
