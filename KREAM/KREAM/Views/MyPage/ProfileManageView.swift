//
//  ProfileManageView.swift
//  KREAM
//
//  Created by KKM on 10/4/24.
//

import UIKit

class ProfileManageView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var profileImageView = UIImageView().then {
        $0.image = UIImage(named: "KREAM-profileImage") // 기본 이미지 설정
        $0.contentMode = .scaleAspectFill
    }
    
    public lazy var infoView = UIView()
    
    public lazy var profileInfoLabel = UILabel().then {
        $0.text = "프로필 정보"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var userEmailLabel = UILabel().then {
        $0.text = "유저 이메일"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var userPwdLabel = UILabel().then {
        $0.text = "유저 비밀번호"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var userEmailTextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.placeholder = "이메일을 입력해주세요"
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.isUserInteractionEnabled = false  // 초기 비활성화
    }
    
    public lazy var userPwdTextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.isUserInteractionEnabled = false  // 초기 비활성화
    }
    
    private lazy var titleContainer : AttributeContainer = {
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14)
        container.foregroundColor = UIColor.black
        
        return container
    }()
    
    public lazy var userEmailChangeButton = UIButton().then {
        $0.setTitle("변경", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 5
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    public lazy var userPwdChangeButton = UIButton().then {
        $0.setTitle("변경", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 5
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private func addComponents() {
        self.addSubview(profileImageView)
        self.addSubview(infoView)
        
        infoView.addSubview(profileInfoLabel)
        
        infoView.addSubview(userEmailLabel)
        infoView.addSubview(userEmailTextField)
        infoView.addSubview(userEmailChangeButton)
        
        infoView.addSubview(userPwdLabel)
        infoView.addSubview(userPwdTextField)
        infoView.addSubview(userPwdChangeButton)
        
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide).inset(52)
            make.width.height.equalTo(90)
        }
        
        infoView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.width.equalTo(349)
            make.height.equalTo(191)
        }
        
        profileInfoLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
        }
        
        userEmailLabel.snp.makeConstraints { make in
            make.top.equalTo(profileInfoLabel.snp.bottom).offset(23)
            make.leading.equalToSuperview()
        }
        
        userEmailTextField.snp.makeConstraints { make in
            make.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(67)
            make.height.equalTo(32)
        }
        
        userEmailChangeButton.snp.makeConstraints { make in
            make.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            make.trailing.equalToSuperview()
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
        
        userPwdLabel.snp.makeConstraints { make in
            make.top.equalTo(userEmailTextField.snp.bottom).offset(23)
            make.leading.equalToSuperview()
        }
        
        userPwdTextField.snp.makeConstraints { make in
            make.top.equalTo(userPwdLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(67)
            make.height.equalTo(32)
        }
        
        userPwdChangeButton.snp.makeConstraints { make in
            make.top.equalTo(userPwdLabel.snp.bottom).offset(4)
            make.trailing.equalToSuperview()
            make.width.equalTo(58)
            make.height.equalTo(32)
        }
        
        
    }
}
