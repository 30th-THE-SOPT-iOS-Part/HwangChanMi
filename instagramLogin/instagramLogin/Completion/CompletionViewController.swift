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
    
    @IBAction func completionButton(_ sender: Any) {
        // 완료 버튼 클릭 -> 탭 바 화면으로 이동
        
        let tabbarSB = UIStoryboard(name: "TabBar", bundle: nil)
        let tabbarCV = tabbarSB.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        
        tabbarCV.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(tabbarCV, animated: true, completion: nil)
    }
    
    @IBAction func otherAccountButton(_ sender: Any) {
        // 처음 화면으로 돌아가기
        guard let welcomeVC = self.presentingViewController as? UINavigationController else { return }

        self.dismiss(animated: true) {
            welcomeVC.popToRootViewController(animated: true)
        }
    }
    
}
