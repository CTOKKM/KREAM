//
//  ProfileManageViewController.swift
//  KreamApp
//
//  Created by KKM on 10/4/24.
//

import UIKit

class ProfileManageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        self.navigationItem.title = "프로필 관리"
    }
   
    private lazy var profileManageView = ProfileManageView()

}
