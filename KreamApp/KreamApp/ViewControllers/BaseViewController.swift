//
//  TabBarViewController.swift
//  KreamApp
//
//  Created by KKM on 10/2/24.
//

import UIKit

class BaseViewController: UITabBarController {
    
    private let homeVC = HomeViewController()
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let myVC = MyPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(named:"homeFill"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(named:"style"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(named:"shop"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(named:"saved"), tag: 3)
        myVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(named:"myPage"), tag: 4)
        
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
        
        // 탭바 색상 및 모양 설정 (옵션)
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.backgroundColor = .white
        
    }
    
}
