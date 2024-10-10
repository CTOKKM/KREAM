//
//  SavedItemTableViewCell.swift
//  KREAM
//
//  Created by KKM on 10/10/24.
//

import UIKit

class SavedItemCell: UITableViewCell {
    
    static let identifier = "SavedItemCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstaints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedItemImageView.image = nil
        self.savedItemName.text = nil
        self.savedItemDiscription.text = nil
        self.savedItemPrice.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var savedItemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true // cornerRadius 적용
        return imageView
    }()
    
    private lazy var savedItemName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        name.textColor = UIColor.black
        return name
    }()
    
    private lazy var savedItemDiscription: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 9, weight: .light)
        description.textColor = UIColor.gray
        description.numberOfLines = 0 // 여러 줄로 표시되도록 설정
        return description
    }()
    
    private lazy var savedItemPrice: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        price.textColor = UIColor.black
        return price
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "KREAM-bookmark"), for: .normal)
        return btn
    }()
    
    private func setViews() {
        self.addSubview(savedItemImageView)
        self.addSubview(savedItemName)
        self.addSubview(savedItemDiscription)
        self.addSubview(savedItemPrice) // 가격 레이블 추가
        self.addSubview(bookmarkButton)
    }
    
    private func setConstaints() {
        savedItemImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.height.equalTo(72)
        }
        
        savedItemName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalTo(savedItemImageView.snp.right).offset(13)
            $0.right.equalToSuperview().offset(-142)
        }
        
        savedItemDiscription.snp.makeConstraints {
            $0.top.equalTo(savedItemName.snp.bottom).offset(4) // 이름과 설명 사이 간격 조정
            $0.left.equalTo(savedItemName)
            $0.right.equalToSuperview().offset(-142)
        }
        
        savedItemPrice.snp.makeConstraints {
            $0.top.equalTo(savedItemDiscription.snp.bottom).offset(8) // 설명과 가격 사이 간격
            $0.right.equalToSuperview().offset(-16)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.right.equalToSuperview().offset(-17)
            $0.width.equalTo(14)
            $0.height.equalTo(18)
        }
    }
    
    public func configure(model: SavedItemModel) {
        self.savedItemImageView.image = UIImage(named: model.itemImage)
        self.savedItemName.text = model.itemTitle
        self.savedItemDiscription.text = model.itemDiscription
        self.savedItemPrice.text = model.itemPrice // 가격 데이터 추가
    }
}
