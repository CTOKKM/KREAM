//
//  SavedItemView.swift
//  KREAM
//
//  Created by KKM on 10/10/24.
//

import UIKit
import SnapKit

class SavedItemView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = UILabel().then {
        $0.text = "Saved"
        $0.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        $0.textColor = UIColor.black
    }
    
    private lazy var itemCountLabel: UILabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = UIColor.black
    }
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SavedItemCell.self, forCellReuseIdentifier: SavedItemCell.identifier)
        tableView.separatorStyle = .singleLine
        return tableView
    }()

    private func setViews() {
        self.addSubview(title)
        self.addSubview(itemCountLabel)
        self.addSubview(tableView)
    }
    
    private func setConstraints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.leading.equalToSuperview().offset(10)
        }
        
        itemCountLabel.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(10)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(itemCountLabel.snp.bottom).offset(12)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    public func updateItemCountLabel(with count: Int) {
        self.itemCountLabel.text = "전체 \(count)개"
    }
}
