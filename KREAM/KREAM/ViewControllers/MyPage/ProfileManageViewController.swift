//
//  ProfileManageViewController.swift
//  KREAM
//
//  Created by KKM on 10/4/24.
//

import UIKit

class ProfileManageViewController: UIViewController {

    var userEmail: String?  // 이메일을 받을 변수
    var userPwd: String?    // 비밀번호를 받을 변수
    
    private lazy var profileManageView = ProfileManageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileManageView
        self.navigationItem.title = "프로필 관리"
        
        // 전달받은 이메일과 비밀번호 설정
        profileManageView.userEmailTextField.text = userEmail
        profileManageView.userPwdTextField.text = userPwd
        
        // 초기 상태에서는 텍스트 필드 비활성화
        profileManageView.userEmailTextField.isUserInteractionEnabled = false
        profileManageView.userPwdTextField.isUserInteractionEnabled = false
        
        // "변경" 버튼에 액션 추가
        profileManageView.userEmailChangeButton.addTarget(self, action: #selector(changeEmailTapped), for: .touchUpInside)
        profileManageView.userPwdChangeButton.addTarget(self, action: #selector(changePasswordTapped), for: .touchUpInside)
    }
    
    // 이메일 변경 버튼 클릭 시
    @objc
    private func changeEmailTapped() {
        if profileManageView.userEmailChangeButton.title(for: .normal) == "변경" {
            // 텍스트 필드 활성화 및 버튼 텍스트 "확인"으로 변경
            profileManageView.userEmailTextField.isUserInteractionEnabled = true
            profileManageView.userEmailChangeButton.setTitle("확인", for: .normal)
            profileManageView.userEmailTextField.becomeFirstResponder()
        } else {
            // 수정된 이메일 저장 및 텍스트 필드 비활성화
            if let updatedEmail = profileManageView.userEmailTextField.text {
                saveUpdatedLoginData(email: updatedEmail, password: userPwd ?? "")
            }
            profileManageView.userEmailTextField.isUserInteractionEnabled = false
            profileManageView.userEmailChangeButton.setTitle("변경", for: .normal)
        }
    }
    
    // 비밀번호 변경 버튼 클릭 시
    @objc
    private func changePasswordTapped() {
        if profileManageView.userPwdChangeButton.title(for: .normal) == "변경" {
            // 텍스트 필드 활성화 및 버튼 텍스트 "확인"으로 변경
            profileManageView.userPwdTextField.isUserInteractionEnabled = true
            profileManageView.userPwdChangeButton.setTitle("확인", for: .normal)
            profileManageView.userPwdTextField.becomeFirstResponder()
        } else {
            // 수정된 비밀번호 저장 및 텍스트 필드 비활성화
            if let updatedPwd = profileManageView.userPwdTextField.text {
                saveUpdatedLoginData(email: userEmail ?? "", password: updatedPwd)
            }
            profileManageView.userPwdTextField.isUserInteractionEnabled = false
            profileManageView.userPwdChangeButton.setTitle("변경", for: .normal)
        }
    }
    
    // 수정된 로그인 정보를 UserDefaults에 저장하는 메서드
    private func saveUpdatedLoginData(email: String, password: String) {
        let updatedLoginData = LoginModel(id: email, pwd: password)
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(updatedLoginData) {
            defaults.set(encoded, forKey: "loginData")
        }
    }
}
