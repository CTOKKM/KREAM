//
//  MyViewController.swift
//  KreamApp
//
//  Created by KKM on 10/2/24.
//

import UIKit
import SnapKit
import Then

class MyPageViewController: UIViewController {
    
    private let profileManageVC = UINavigationController(rootViewController: ProfileManageViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addView()
        addConstraints()
    }
    
    private lazy var myPageView = MyPageView().then {
        $0.profileManageButton.addTarget(self, action: #selector(profileManageButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func profileManageButtonTapped() {
        
        navigationController?.pushViewController(profileManageVC, animated: true)
    }
    
    private func addView() {
        view.addSubview(myPageView)
    }

    private func addConstraints() {
        myPageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(328)
            make.height.equalTo(193)
            make.centerX.equalToSuperview()
        }
    }
}
