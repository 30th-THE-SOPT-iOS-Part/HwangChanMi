//
//  UIHomeNavigationItem+Extension.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/04.
//

import UIKit

extension UINavigationItem {
    func setRightButtonUI(_ target: Any?, imageName: UIImage?) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage((imageName), for: .normal)
        button.tintColor = .black
    
        let barButtonItem = UIBarButtonItem(customView: button)
        barButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        barButtonItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        barButtonItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
             
        return barButtonItem
    }
}
