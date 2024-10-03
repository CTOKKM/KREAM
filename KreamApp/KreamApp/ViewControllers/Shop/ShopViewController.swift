//
//  ShopViewController.swift
//  KreamApp
//
//  Created by KKM on 10/2/24.
//

import UIKit
import SnapKit

class ShopViewController: UIViewController {

    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        label.text = "shopVC"
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }

}
