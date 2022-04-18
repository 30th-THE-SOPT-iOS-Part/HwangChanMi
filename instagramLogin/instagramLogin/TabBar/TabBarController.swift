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
        let homeSB = UIStoryboard(name: "Home", bundle: nil)
        let searchSB = UIStoryboard(name: "Search", bundle: nil)
        let reelsSB = UIStoryboard(name: "Reels", bundle: nil)
        let shopSB = UIStoryboard(name: "Shop", bundle: nil)
        let profileSB = UIStoryboard(name: "Profile", bundle: nil)
        
        let homeVC = homeSB.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let searchVC = searchSB.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        let reelsVC = reelsSB.instantiateViewController(withIdentifier: "ReelsViewController") as! ReelsViewController
        let shopVC = shopSB.instantiateViewController(withIdentifier: "ShopViewController") as! ShopViewController
        let profileVC = profileSB.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        homeVC.tabBarItem = UITabBarItem(
            title: "", image: UIImage(named: "icn_home"), selectedImage: UIImage(named: "icn_home_seleted"))
        
        searchVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_search"), selectedImage: UIImage(named: "icn_search_seleted"))
        
        reelsVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_reels"), selectedImage: UIImage(named: "icn_reels_seleted"))
        
        shopVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_shop"), selectedImage: UIImage(named: "icn_shop_seleted"))
        
        profileVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_profile"), selectedImage: UIImage(named: "icn_profile_seleted"))
        
        setViewControllers([homeVC, searchVC, reelsVC, shopVC, profileVC], animated: true)
        
    }
    
        
}

