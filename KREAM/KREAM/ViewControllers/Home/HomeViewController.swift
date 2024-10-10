//
//  HomeViewController.swift
//  KREAM
//
//  Created by KKM on 10/4/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let label = UILabel().then {
            $0.text = "Home VC"
            $0.font = UIFont.systemFont(ofSize: 36, weight: .bold)
            $0.textAlignment = .center
            $0.textColor = .black
        }
        
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
