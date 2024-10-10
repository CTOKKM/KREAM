//
//  SavedViewController.swift
//  KREAM
//
//  Created by KKM on 10/4/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    let data = dummyItemModel.itemDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedItemView
        view.backgroundColor = .white
        
        // 테이블뷰 데이터 개수에 맞게 itemCountLabel 업데이트
        updateItemCount()
    }
    
    private lazy var savedItemView: SavedItemView = {
        let view = SavedItemView()
        view.tableView.dataSource = self
        view.tableView.delegate = self
        return view
    }()
    
    // 데이터의 개수에 맞게 itemCountLabel을 업데이트하는 메서드
    private func updateItemCount() {
        savedItemView.updateItemCountLabel(with: data.count)
    }
}

