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
        
        let homeSB = UIStoryboard(name: "Home", bundle: nil)
        let searchSB = UIStoryboard(name: "Search", bundle: nil)
        let reelsSB = UIStoryboard(name: "Reels", bundle: nil)
        let shopSB = UIStoryboard(name: "Shop", bundle: nil)
        let profileSB = UIStoryboard(name: "Profile", bundle: nil)
        
        guard let homeVC = homeSB.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController,
              let searchVC = searchSB.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController,
              let reelsVC = reelsSB.instantiateViewController(withIdentifier: "ReelsViewController") as? ReelsViewController,
              let shopVC = shopSB.instantiateViewController(withIdentifier: "ShopViewController") as? ShopViewController,
              let profileVC = profileSB.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { return }

        homeVC.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "icn_home"), selectedImage: UIImage(named: "icn_home_seleted"))

        searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_search"), selectedImage: UIImage(named: "icn_search_seleted"))

        reelsVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_reels"), selectedImage: UIImage(named: "icn_reels_seleted"))

        shopVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_shop"), selectedImage: UIImage(named: "icn_shop_seleted"))

        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_profile")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icn_profile_seleted")?.withRenderingMode(.alwaysOriginal))

        setViewControllers([homeVC, searchVC, reelsVC, shopVC, profileVC], animated: true)
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem){
        tabBar.backgroundColor = item != (tabBar.items!)[2] ? .white : .black
        tabBar.tintColor = item != (tabBar.items!)[2] ? .black : .white
        tabBar.unselectedItemTintColor = item != (tabBar.items!)[2] ? .black : .white
    }

}

