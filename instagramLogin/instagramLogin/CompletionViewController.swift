//
//  CompletionViewController.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/04/04.
//

import UIKit

class CompletionViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var nameData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameData()
    }
    
    
    private func setNameData() {
        if let nameData = nameData {
            // 전닯받은 데이터 + 문장을 합쳐서 문자열을 출력한다
            dataLabel.text = nameData + "님, instagram에 오신 것을 환영합니다."
            dataLabel.sizeToFit()
        }
    }
    
    @IBAction func completionButton(_ sender: Any) {    //나를 호출한 VC
        guard let firstVC = self.presentingViewController as? UINavigationController else { return }

        self.dismiss(animated: true) {
            firstVC.popToRootViewController(animated: true)
        }
    }
}
