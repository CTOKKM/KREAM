//
//  BaseViewController.swift
//  KREAM
//
//  Created by KKM on 10/4/24.
//

import UIKit

class BaseViewController: UITabBarController {
    private let homeVC = HomeViewController()
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let myPageVC = MyPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named: "KREAM-home")?.withRenderingMode(.alwaysOriginal), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named: "KREAM-style")?.withRenderingMode(.alwaysOriginal), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named: "KREAM-shop")?.withRenderingMode(.alwaysOriginal), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named: "KREAM-saved")?.withRenderingMode(.alwaysOriginal), tag: 3)
        myPageVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named: "KREAM-myPage")?.withRenderingMode(.alwaysOriginal), tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myPageVC]
        
        setUpTabbarAppearance()
        setUpNavigationBarItem()
    }
    
    private func setUpNavigationBarItem() {
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    private func setUpTabbarAppearance() {
       
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
        tabBar.tintColor = .black
    }
    
}

