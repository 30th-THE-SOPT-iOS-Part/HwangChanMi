//
//  PasswordViewController.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/04/04.
//

import UIKit

class PasswordViewController: UIViewController {
    
    var nameData: String?
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pwTextField: UITextField!
    
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
    
    // 다음 버튼, 입력받은 데이터를 다음 VC를 modal로 present 함.
    @IBAction func nextButton(_ sender: Any) {
        
        let completionSB = UIStoryboard(name: "Completion", bundle: nil)
        let completionVC = completionSB.instantiateViewController(withIdentifier: "CompletionViewController") as! CompletionViewController
    
        // 전달받은 데이터의 값이 있으면, 다음 VC 프로퍼티로 값을 넘겨 준다
        if let nameData = nameData {
            completionVC.nameData = nameData
        }
        
        self.present(completionVC, animated: true, completion: nil)
    }
    
    

    @IBAction func passEdit(_ sender: Any) {
        setButton()
    }
    
    private func setButton() {
        if pwTextField.hasText {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
}
