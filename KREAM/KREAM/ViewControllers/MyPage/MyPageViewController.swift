//
//  MyPageViewController.swift
//  KREAM
//
//  Created by KKM on 10/4/24.
//

import UIKit
import SnapKit

class MyPageViewController: UIViewController {
    
    private lazy var myPageView = MyPageView().then {
        $0.profileManageButton.addTarget(self, action: #selector(profileManageButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
    }
    
    @objc
    private func profileManageButtonTapped() {
        let profileManageVC = ProfileManageViewController()
        
        // UserDefaults에서 이메일과 비밀번호 불러오기
        if let loginData = loadLoginData() {
            profileManageVC.userEmail = loginData.id
            profileManageVC.userPwd = loginData.pwd
        }
        
        navigationController?.pushViewController(profileManageVC, animated: true)
    }
    
    private func loadLoginData() -> LoginModel? {
        let defaults = UserDefaults.standard
        if let savedData = defaults.data(forKey: "loginData") {
            let decoder = JSONDecoder()
            if let loadedLogin = try? decoder.decode(LoginModel.self, from: savedData) {
                return loadedLogin
            }
        }
        return nil
    }
    
    private func addView() {
        view.addSubview(myPageView)
        myPageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(75)
            make.width.equalTo(328)
            make.height.equalTo(193)
            make.centerX.equalToSuperview()
        }
    }
}
