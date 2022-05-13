//
//  UIViewController++.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/13.
//

import UIKit

extension UIViewController {
    func alert(title: String, message: String?, handler: @escaping (UIAlertAction) -> Void) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: handler)
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
}
