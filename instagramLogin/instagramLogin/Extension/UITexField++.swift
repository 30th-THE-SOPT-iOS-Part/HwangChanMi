//
//  UITexField++.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/04/13.
//

import UIKit

extension UITextField {
    
    func setIcon(_ image: UIImage?) {
        guard let image = image else { return }
        
        let iconButton = UIButton(frame: CGRect(x: 0, y: 5, width: 20, height: 20))
        iconButton.setImage(image, for: .normal)
        
        iconButton.addTarget(self, action: #selector(handlePasswordIconTapped), for: .touchUpInside)
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconButton)
        
        rightView = iconContainerView
        rightView?.tintColor = .blue
        rightViewMode = .always
    }
    
    @objc func handlePasswordIconTapped(_ sender: UIButton) {
        isSecureTextEntry ? sender.setImage(UIImage(named: "password hidden eye icon"), for: .normal) : sender.setImage(UIImage(named: "password shown eye icon"), for: .normal)
        
        isSecureTextEntry.toggle()
    }
    
}
