//
//  HomeViewController.swift
//  KreamApp
//
//  Created by KKM on 10/2/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        label.text = "HomeVC"
        
        view.addSubview(label)
        
        label.snp.makeConstraints {
            $0.width.height.equalTo(100)  // 너비와 높이 100
            $0.centerX.equalToSuperview()  // 가로 방향 중앙 정렬
            $0.centerY.equalToSuperview()  // 세로 방향 중앙 정렬
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
