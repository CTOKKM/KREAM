//
//  LoginViewController.swift
//  KreamApp
//
//  Created by KKM on 9/26/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // 로그인 모델을 위한 UserModel 인스턴스 생성
    private var loginModel = LoginModel(id: "", pwd: "")
    
    // 로그인 화면에 사용될 LoginView
    private var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LoginView 초기화 및 추가
        loginView = LoginView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginView)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: self.view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        // 로그인 버튼에 액션 추가
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        // 키보드 알림 등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // 로그인 버튼을 눌렀을 때 호출되는 메서드
    @objc
    private func handleLogin() {
        // 사용자 입력값을 가져와서 모델에 저장
        guard let id = loginView.mailTextField.text, !id.isEmpty,
              let pwd = loginView.passwordTextField.text, !pwd.isEmpty else {
            showAlert(message: "이메일과 비밀번호를 입력하세요.")
            return
        }
        
        // userModel에 id와 pwd 저장
        loginModel.id = id
        loginModel.pwd = pwd
        
        // 간단한 처리: 콘솔에 사용자 정보 출력
        print("ID: \(loginModel.id), PWD: \(loginModel.pwd)")
        
        // 로그인 검증 (id: "gkzl95@naver.com", pwd: "1234")
        if loginModel.id == "1234@gmail.com" && loginModel.pwd == "1234" {
            // 로그인 성공 시 BaseViewController로 이동. Modal 방식.
            let baseViewController = BaseViewController()
            
            baseViewController.modalPresentationStyle = .fullScreen
            present(baseViewController, animated: true)
        } else {
            showAlert(message: "아이디 또는 비밀번호가 잘못되었습니다.")
        }
    }
    
    // 경고창을 띄우는 메서드
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // 키보드가 보일 때 호출되는 메서드
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.view.frame.origin.y = -keyboardSize.height / 2
        }
    }

    // 키보드가 숨겨질 때 호출되는 메서드
    @objc private func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }
}
