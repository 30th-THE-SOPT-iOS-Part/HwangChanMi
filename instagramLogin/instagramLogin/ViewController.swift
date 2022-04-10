//
//  ViewController.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/04/04.
//

import UIKit

class ViewController: UIViewController {
    
    var nameData: String?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setButton()
    }
    
    private func setUI() {
        imgView.image = UIImage(named: "Instagram Black Logo.png")
        nameTextfield.clearButtonMode = .whileEditing
    }
    
    // 가입하기 버튼, 다음 VC로 데이터 push
    @IBAction func joinButton(_ sender: Any) {
        guard let userNameVC = self.storyboard?.instantiateViewController(withIdentifier: "UsernameViewController") as? UsernameViewController else { return }
        
        
        self.navigationController?.pushViewController(userNameVC, animated: true)
    }
    
    // 로그인 버튼, 마지막 완료 화면으로 modal로 present
    @IBAction func loginButton(_ sender: Any) {
        guard let joinVC = self.storyboard?.instantiateViewController(withIdentifier: "CompletionViewController") as? CompletionViewController else { return }
        
        joinVC.nameData = nameTextfield.text
        
        self.present(joinVC, animated: true, completion: nil)
    }
    
    @IBAction func nameEdit(_ sender: Any) {
        setButton()
    }
    
    @IBAction func passEdit(_ sender: Any) {
        setButton()
    }

    private func setButton(){
        if nameTextfield.hasText && pwTextfield.hasText {
            loginButton.isEnabled = true
        } else{
            loginButton.isEnabled = false
        }
    }

}

