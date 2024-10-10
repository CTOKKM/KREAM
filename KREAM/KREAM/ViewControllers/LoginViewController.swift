//
//  LoginViewController.swift
//  KREAM
//
//  Created by KKM on 10/4/24.
//

import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
        
        // 앱 실행 시 UserDefaults에서 로그인 정보를 불러옴.
        if let savedLogin = loadLoginData() {
            loginView.IDTextField.text = savedLogin.id
            loginView.pwdTextField.text = savedLogin.pwd
        }
    }
    
    private lazy var loginView = LoginView().then {
        $0.loginButton.addTarget(self, action: #selector(LoginButtonTapped) , for: .touchUpInside)
    }

    @objc
    private func LoginButtonTapped() {
        guard let id = loginView.IDTextField.text, let pwd = loginView.pwdTextField.text else { return }
        
        let loginData = LoginModel(id: id, pwd: pwd)
        
        // UserDefaults에 로그인 정보 저장
        saveLoginData(loginData)
        
        let BaseVC = BaseViewController()
        
        let navController = UINavigationController(rootViewController: BaseVC)
        
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
    
    // UserDefaults에 로그인 데이터를 저장하는 메서드
    private func saveLoginData(_ loginData: LoginModel) {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(loginData) {
            defaults.set(encoded, forKey: "loginData")
        }
    }
    
    // UserDefaults에서 로그인 데이터를 불러오는 메서드
    private func loadLoginData() -> LoginModel? {
        let defaults = UserDefaults.standard
        if let savedData = defaults.data(forKey: "loginData") {
            let decoder = JSONDecoder()
            if let loadedLogin = try?decoder.decode(LoginModel.self, from: savedData) {
                return loadedLogin
            }
        }
        return nil
    }
    
    // UserDefaults에서 로그인 정보를 제거하는 메서드
    private func clearLoginData() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "loginData")
    }
}

