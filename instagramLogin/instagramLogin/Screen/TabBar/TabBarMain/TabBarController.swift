//
//  TabBarController.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/04/19.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarController()
    }
    
    func setTabBarController() {
        
        tabBar.unselectedItemTintColor = .black
        tabBar.tintColor = .black
        
        guard let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController,
              let searchVC = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController,
              let reelsVC = UIStoryboard(name: "Reels", bundle: nil).instantiateViewController(withIdentifier: "ReelsViewController") as? ReelsViewController,
              let shopVC = UIStoryboard(name: "Shop", bundle: nil).instantiateViewController(withIdentifier: "ShopViewController") as? ShopViewController,
              let profileVC = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }

        setViewControllers([homeVC, searchVC, reelsVC, shopVC, profileVC], animated: true)
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem){
        tabBar.barTintColor = item != (tabBar.items!)[2] ? .white : .black
        tabBar.tintColor = item != (tabBar.items!)[2] ? .black : .white
        tabBar.unselectedItemTintColor = item != (tabBar.items!)[2] ? .black : .white
    }

}

