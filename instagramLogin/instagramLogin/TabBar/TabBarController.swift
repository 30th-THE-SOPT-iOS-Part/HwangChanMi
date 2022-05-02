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

        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController"),
              let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController"),
              let reelsVC = self.storyboard?.instantiateViewController(withIdentifier: "ReelsViewController"),
              let shopVC = self.storyboard?.instantiateViewController(withIdentifier: "ShopViewController"),
              let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") else { return}
    
        
        homeVC.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "icn_home"), selectedImage: UIImage(named: "icn_home_seleted"))
        
        searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_search"), selectedImage: UIImage(named: "icn_search_seleted"))
        
        reelsVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_reels"), selectedImage: UIImage(named: "icn_reels_seleted"))
        
        shopVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_shop"), selectedImage: UIImage(named: "icn_shop_seleted"))
        
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_profile")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icn_profile_seleted")?.withRenderingMode(.alwaysOriginal))
        
        setViewControllers([homeVC, searchVC, reelsVC, shopVC, profileVC], animated: true)
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem){
            if item != (tabBar.items!)[2] {
                tabBar.backgroundColor = .white
                tabBar.tintColor = .black
                tabBar.unselectedItemTintColor = .black
            }
            else{
                tabBar.backgroundColor = .black
                tabBar.tintColor = .white
                tabBar.unselectedItemTintColor = .white
            }
        }

}

