//
//  UsernameViewController.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/04/04.
//

import UIKit

class UsernameViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonState: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // backButton의 색상을 바꾸고, 텍스트를 비웠다.
        
        setButton()
    }
    
    // 다음 버튼, textfield의 데이터를 다음 VC로 넘겨 준다. push
    @IBAction func nextButton(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "PasswordViewController") as? PasswordViewController else { return }
        
        nextVC.nameData = textField.text
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }


    @IBAction func nameEdit(_ sender: Any) {
        setButton()
    }
    
    private func setButton() {
        if textField.hasText {
            buttonState.isEnabled = true
        } else {
            buttonState.isEnabled = false
        }
    }
    
}
