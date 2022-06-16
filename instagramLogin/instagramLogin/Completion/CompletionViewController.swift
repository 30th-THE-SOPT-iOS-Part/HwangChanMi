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
    var passwordData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameData()
    }
    
    
    private func setNameData() {
        if let nameData = nameData {
            // 전닯받은 데이터 + 문장을 합쳐서 문자열을 출력한다
            dataLabel.text = "\(nameData)님, instagram에 오신 것을 환영합니다."
            dataLabel.sizeToFit()
        }
    }
    
    @IBAction func completionButton(_ sender: Any) {
        // 완료 버튼 클릭 -> 탭 바 화면으로 이동
        signUp()
        
//        let tabbarSB = UIStoryboard(name: "TabBar", bundle: nil)
//        let tabbarCV = tabbarSB.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
//
//        tabbarCV.modalPresentationStyle = UIModalPresentationStyle.fullScreen
//        present(tabbarCV, animated: true, completion: nil)
//
//        guard let welcomeVC = self.presentingViewController as? UINavigationController else { return }
//
//        self.dismiss(animated: true) {
//            welcomeVC.popToRootViewController(animated: true)
        
    }

    
    @IBAction func otherAccountButton(_ sender: Any) {
        // 처음 화면으로 돌아가기
        guard let welcomeVC = self.presentingViewController as? UINavigationController else { return }

        self.dismiss(animated: true) {
            welcomeVC.popToRootViewController(animated: true)
        }
    }
    
}

extension CompletionViewController {
    func signUp() {
        // 텍스트 필드의 있는 값을 받아옵니다.
        guard let email = nameData else { return }
        guard let password = passwordData else { return }
        
        // 서버 통신 서비스 코드를 싱글톤 변수를 통해서 접근
        // 호출 후에 받은 응답을 가지고, 적절한 처리 해주기
        
        UserService.shared.signUp(
            email: email,
            password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                if data.status == 201 {
                    self.alert(title: "회원가입 성공", message: nil) { _
                        in
                        guard let welcomeVC = self.presentingViewController as? UINavigationController else { return }

                        self.dismiss(animated: true) {
                            welcomeVC.popToRootViewController(animated: true)
                        
                        print("아님 여기?")
                        
                        // 이게 왜 안 되지...
                        // self.navigationController?.popToRootViewController(animated: true)
                    }
                }
            }
            default:
                self.alert(title: "회원가입 실패", message: nil, handler: {_ in})
                print("혹시?")
                }
            }
        }
}
