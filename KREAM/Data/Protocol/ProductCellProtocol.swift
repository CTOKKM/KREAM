//
//  ProductCellProtocol.swift
//  KREAM
//
//  Created by KKM on 11/16/24.
//

import UIKit

// 크림 상품 셀에 사용할 프로토콜
protocol ProductCellProtocol {
    var imageView: UIImageView { get }
    var titleText: UILabel { get }
    var priceLabel: UILabel { get }
    
    func configure(model: RequiredCellProtocol)
}
