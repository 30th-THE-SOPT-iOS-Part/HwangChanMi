//
//  ViewController.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/04/04.
//

import UIKit

class ViewController: UIViewController {
    
    // 이미지 아웃렛 변수
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginState: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named: "Instagram Black Logo.png")
        userName.clearButtonMode = .whileEditing
        setButton()
        
        changeBackButton()
    }
    
    // 가입하기 버튼, 다음 VC로 데이터 push
    @IBAction func joinButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "UsernameViewController") as? UsernameViewController else { return }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    // 로그인 버튼, 마지막 완료 화면으로 modal로 present
    @IBAction func loginButton(_ sender: Any) {
        guard let joinVC = self.storyboard?.instantiateViewController(withIdentifier: "CompletionViewController") as? CompletionViewController else { return }
        
        self.present(joinVC, animated: true, completion: nil)
    }
    
    
    // back button 이미지 바꾸기 -> 안되는 이유?
    private func changeBackButton() {
        let backButton = UIImage(named: "icon-back-24.png")

        self.navigationController?.navigationBar.backIndicatorImage = backButton
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        self.navigationItem.backButtonTitle = ""
    }
    
    @IBAction func nameEdit(_ sender: Any) {
        setButton()
    }
    
    @IBAction func passEdit(_ sender: Any) {
        setButton()
    }

    private func setButton(){
        if userName.hasText && password.hasText {
            loginState.isEnabled = true
        } else{
            loginState.isEnabled = false
        }
    }

}

