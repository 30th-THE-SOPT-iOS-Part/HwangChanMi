//
//  UsernameViewController.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/04/04.
//

import UIKit

class UsernameViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton()
        changeBackButton()
    }
    
    private func changeBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(named: "icn_back_24"), style: .done, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
      }
    
    @objc func back() {
      self.navigationController?.popViewController(animated: true)
    }
    
    
    // 다음 버튼, textfield의 데이터를 다음 VC로 넘겨 준다. push
    @IBAction func nextButton(_ sender: Any) {
        let passwordSB = UIStoryboard(name: "Password", bundle: nil)
        let passwordVC = passwordSB.instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
        
        passwordVC.nameData = nameTextField.text
        
        self.navigationController?.pushViewController(passwordVC, animated: true)
    }


    @IBAction func nameEdit(_ sender: Any) {
        setButton()
    }
    
    private func setButton() {
        if nameTextField.hasText {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
}
