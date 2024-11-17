//
//  PurchaseModel.swift
//  KREAM
//
//  Created by KKM on 11/16/24.
//

import Foundation

// 상품 구매 뷰, 점퍼 데이터
struct PurchaseModel: RequiredCellProtocol {
    var imageView: String
    var productName: String
}

// MARK: - DummyData
final class PurchaseData {
    static let purchaseData: [PurchaseModel] = [
        .init(imageView: "purchase0", productName: "마뗑킴 로고 코팅 점퍼 블루"),
        .init(imageView: "purchase2", productName: "마뗑킴 로고 코팅 점퍼 블루"),
        .init(imageView: "purchase3", productName: "마뗑킴 로고 코팅 점퍼 블루"),
        .init(imageView: "purchase4", productName: "마뗑킴 로고 코팅 점퍼 블루"),
        .init(imageView: "purchase5", productName: "마뗑킴 로고 코팅 점퍼 블루"),
        .init(imageView: "purchase6", productName: "마뗑킴 로고 코팅 점퍼 블루"),
        .init(imageView: "purchase7", productName: "마뗑킴 로고 코팅 점퍼 블루")
    ]
}

/*
 1. PurchaseModel:
    - 상품 구매 화면에 표시할 때 마뗑킴 점퍼 데이터를 나타내는 구조체.
    - RequiredCellProtocol을 채택하여 imageView라는 공통 속성을 구현.
    - 추가적으로 productName 속성을 정의하여 상품 이름을 저장.
 2. PurchaseData:
    - 더미 데이터를 생성하고 관리하는 클래스
    - purchaseData라는 정적 배열로 PurchaseModel 객체들을 포함.
    - 이 데이터를 통해 상품 리스트를 미리 정의하고, UI에 테스트 데이터로 활용 가능.
 3. 사용 의도:
    - PurchaseModel은 UI에서 각 점퍼의 이미지와 이름을 표시하는 데 사용됨
    - PurchaseData.purchaseData는 쉽게 접근할 수 있도록 제공하는 정적 데이터 소스 역할.
 4. 장점:
    - 프로토콜 기반 설계: RequiredCellProtocol을 채택해 다른 모델들과 일관된 방식으로 처리 가능.
    - 재사용 가능성: PurchaseData를 통해 동일한 데이터셋을 여러 화면에서 재사용 가능.
    - 유연성: 새로운 상품 데이터를 추가하거나 수정하기 쉽도록 설계.
 
 요약
    - PurchaseModel은 점퍼 데이터를 관리하며, 프로토콜을 통해 일관성을 유지.
    - PurchaseData는 더미 데이터를 관리하는 역할로, UI 테스트나 초기 데이터 설정에 활용됨.
 */
