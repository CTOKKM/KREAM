//
//  LoginView.swift
//  KREAM
//
//  Created by KKM on 10/4/24.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()  // 필요한 UI 컴포넌트 추가
        self.setupActions()   // 텍스트 필드 변경 감지
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 입력된 이메일과 비밀번호가 유효한지 확인하고, 로그인 버튼의 상태 검정색으로 업데이트
    @objc
    private func textFieldsDidChange() {
        let isEmailValid = isValidEmail(IDTextField.text ?? "")
        let isPasswordValid = isValidPassword(pwdTextField.text ?? "")
        
        // 이메일과 비밀번호가 유효할 경우 로그인 버튼의 배경색을 검정색으로 변경
        if isEmailValid && isPasswordValid {
            loginButton.backgroundColor = .black
        } else {
            loginButton.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)  // 기본 회색
        }
    }
    
    // MARK: - 이메일과 비밀번호 입력값을 변경 감지
    private func setupActions() {
        IDTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        pwdTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    // MARK: - 이메일 유효성 검사 함수
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    // MARK: - 비밀번호 유효성 검사 함수
    private func isValidPassword(_ password: String) -> Bool {
        return !password.isEmpty
    }
    
    // MARK: - UI 요소들 정의
    public lazy var logoImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "KREAM-logo")
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    public lazy var IDLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.text = "이메일 주소"
        label.textAlignment = .left
        return label
    }()
    
    public lazy var pwdLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.text = "비밀번호"
        label.textAlignment = .left
        return label
    }()
    
    public lazy var IDTextField : UITextField = {
        let tf = UITextField()
        tf.textAlignment = .left
        tf.font = UIFont.systemFont(ofSize: 12)
        tf.placeholder = "예) kream@kream.co.kr"
        tf.layer.cornerRadius = 15
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        tf.leftViewMode = .always
        tf.autocapitalizationType = .none  // 자동 대문자화 비활성화
        tf.keyboardType = .emailAddress
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    public lazy var pwdTextField : UITextField = {
        let tf = UITextField()
        tf.textAlignment = .left
        tf.font = UIFont.systemFont(ofSize: 12)
        tf.placeholder = "비밀번호를 입력해주세요"
        tf.isSecureTextEntry = true  // 비밀번호 입력
        tf.layer.cornerRadius = 15
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        tf.leftViewMode = .always
        return tf
    }()
    
    public lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)  // 초기 회색
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var titleContainer : AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        container.foregroundColor = UIColor.black
        return container
    }()
    
    public lazy var kakaoLoginButton : UIButton = {
        let btn = UIButton()
        let leftImageView = UIImageView(image: UIImage(named: "KREAM-kakao"))
        btn.addSubview(leftImageView)
        leftImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(17)
        }
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("카카오로 로그인", attributes: titleContainer)
        config.titleAlignment = .center
        config.background.strokeWidth = 1
        config.background.strokeColor = .lightGray
        config.cornerStyle = .large
        btn.configuration = config
        return btn
    }()
    
    public lazy var appleLoginButton : UIButton = {
        let btn = UIButton()
        let leftImageView = UIImageView(image: UIImage(named: "KREAM-apple"))
        btn.addSubview(leftImageView)
        leftImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(17)
        }
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = AttributedString("Apple로 로그인", attributes: titleContainer)
        config.titleAlignment = .center
        config.background.strokeWidth = 1
        config.background.strokeColor = .lightGray
        config.cornerStyle = .large
        btn.configuration = config
        return btn
    }()
    
    // MARK: - UI 요소들을 뷰에 추가 및 레이아웃 설정
    private func addComponents() {
        self.addSubview(logoImageView)
        self.addSubview(IDLabel)
        self.addSubview(pwdLabel)
        self.addSubview(IDTextField)
        self.addSubview(pwdTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(126)
            make.width.equalTo(287)
            make.height.equalTo(75)
        }
        
        IDLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(87)
            make.leading.trailing.equalToSuperview().inset(45)
        }
        
        IDTextField.snp.makeConstraints { make in
            make.top.equalTo(IDLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(34)
        }
        
        pwdLabel.snp.makeConstraints { make in
            make.top.equalTo(IDTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(45)
        }
        
        pwdTextField.snp.makeConstraints { make in
            make.top.equalTo(pwdLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(34)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(pwdTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(38)
        }
        
        kakaoLoginButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(87)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(40)
        }
        
        appleLoginButton.snp.makeConstraints { make in
            make.top.equalTo(kakaoLoginButton.snp.bottom).offset(22)
            make.leading.trailing.equalToSuperview().inset(45)
            make.height.equalTo(40)
        }
    }
}
