//
//  WelcomeViewController.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/06/16.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var instaimage: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var eyeButtn: UIButton!
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.isEnabled = false
        }
    }
    
    var nameData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addActionToTextField()
    }
    
    private func setUI() {
        instaimage.image = UIImage(named: "Instagram Black Logo.png")
        userNameTextField.clearButtonMode = .whileEditing
    }
    
    @IBAction func showEyeBtnDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry = sender.isSelected
    }
    
    
    // 가입하기 버튼, 다음 VC로 데이터 push
    @IBAction func joinButton(_ sender: Any) {
        guard let userNameVC = UIStoryboard(name: "Username", bundle: nil).instantiateViewController(withIdentifier: "UsernameViewController") as? UsernameViewController else { return }
        
        self.navigationController?.pushViewController(userNameVC, animated: true)
    }
    
    // 로그인 버튼, 마지막 완료 화면으로 modal로 present
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        guard let joinVC = UIStoryboard(name: "Completion", bundle: nil).instantiateViewController(withIdentifier: "CompletionViewController") as? CompletionViewController else { return }
        
        joinVC.nameData = userNameTextField.text
        
        self.present(joinVC, animated: true, completion: nil)
        
    }
    
    private func addActionToTextField() {
        self.userNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        self.loginButton.isEnabled = (userNameTextField.hasText && passwordTextField.hasText) ? true : false
    }
}
