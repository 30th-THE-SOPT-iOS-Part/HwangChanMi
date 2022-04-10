//
//  PasswordViewController.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/04/04.
//

import UIKit

class PasswordViewController: UIViewController {
    
    var nameData: String?
    @IBOutlet weak var buttonState: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton()
        
    }
    
    // 다음 버튼, 입력받은 데이터를 다음 VC를 modal로 present 함.
    @IBAction func nextButton(_ sender: Any) {
        
        guard let segue = self.storyboard?.instantiateViewController(withIdentifier: "CompletionViewController") as? CompletionViewController else { return }
        
        // 전달받은 데이터의 값이 있으면, 다음 VC 프로퍼티로 값을 넘겨 준다
        if let nameData = nameData {
            segue.nameData = nameData
        }
        
        self.present(segue, animated: true, completion: nil)
    }

    @IBAction func passEdit(_ sender: Any) {
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
