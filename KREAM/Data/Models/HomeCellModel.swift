//
//  HomeCellModel.swift
//  KREAM
//
//  Created by KKM on 11/16/24.
//

import Foundation

/// 홈 탭의 광고 배너, 1번째 섹션
struct BannerModel: RequiredCellProtocol {
    var imageView: String
}

/// 홈 탭의 추천 상품 데이터, 2번째 섹션
struct RecommendProductModel: RequiredCellProtocol {
    var imageView: String
    var titleText: String
}

/// 홈 탭의 판매 상품 데이터, 3번째 섹션
struct ProductGridModel: RequiredCellProtocol {
    var imageView: String
    var purchaseCnt: String
    var selectedTag: Bool
    var titleText: String
    var subTitleText: String
    var priceText: String
    var priceSubText: String
}

/// 홈 탭의 유저 스토리형 데이터, 4번째 섹션
struct UserStoryModel: RequiredCellProtocol {
    var imageView: String
    var userName: String
}

// MARK: - Dummy Data

/// 홈 탭의 섹션별 더미데이터
final class HomeCellModel {
    /* 유저 스토리형 데이터, 4번째 섹션 데이터 */
    static let userStoryData: [UserStoryModel] = [
        .init(imageView: "userCell1", userName: "@katarinabluu"),
        .init(imageView: "userCell2", userName: "@imwinter"),
        .init(imageView: "userCell3", userName: "@thousand_wooo"),
        .init(imageView: "userCell4", userName: "@londonHuman"),
        .init(imageView: "userCell5", userName: "@Faker")
        ]
    
    /* 판매 상품 데이터, 3번째 섹션 데이터 */
    static let productGridData: [ProductGridModel] = [
        .init(imageView: "GridCell0", purchaseCnt: "거래 102만", selectedTag: false, titleText: "Matin Kim", subTitleText: "Matin Kim Logo Coating Jumper", priceText: "228,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell1", purchaseCnt: "거래 12.8만", selectedTag: false, titleText: "MLB", subTitleText: "청키라이너 뉴욕양키스", priceText: "139,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell2", purchaseCnt: "거래 15.8만", selectedTag: true, titleText: "나이키", subTitleText: "Jordan 1 Retro High OG Yellow", priceText: "228,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell3", purchaseCnt: "거래 11.8만", selectedTag: false, titleText: "아디다스", subTitleText: "Human MASEW", priceText: "228,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell4", purchaseCnt: "거래 89.8만", selectedTag: true, titleText: "뉴발란스", subTitleText: "그냥 어떤 물품 유명함..", priceText: "2,000,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell5", purchaseCnt: "거래 54.8만", selectedTag: true, titleText: "어딘가 브랜드", subTitleText: "설명 뭐 넣을까요..!", priceText: "421,991,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell6", purchaseCnt: "거래 3.8만", selectedTag: false, titleText: "아디다스", subTitleText: "삼선 가젤 멋쟁이 신발", priceText: "238,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell7", purchaseCnt: "거래 7.2만", selectedTag: false, titleText: "나이키", subTitleText: "초록색 신발", priceText: "132,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell8", purchaseCnt: "거래 3.1만", selectedTag: true, titleText: "아식스", subTitleText: "요즘 유행하는 신발", priceText: "98,000원", priceSubText: "즉시 구매가"),
        .init(imageView: "GridCell9", purchaseCnt: "거래 25.3만", selectedTag: false, titleText: "나이키", subTitleText: "구두같은 운동화", priceText: "159,000원", priceSubText: "즉시 구매가")
    ]
    
    /* 추천 상품 뎅터, 2번째 섹션 데이터 */
    static let recommendProductData: [RecommendProductModel] = [
        .init(imageView: "homeCell1", titleText: "크림 드로우"),
        .init(imageView: "homeCell2", titleText: "실시간 차트"),
        .init(imageView: "homeCell3", titleText: "남성 추천"),
        .init(imageView: "homeCell4", titleText: "여성 추천"),
        .init(imageView: "homeCell5", titleText: "색다른 추천"),
        .init(imageView: "homeCell6", titleText: "정가 아래"),
        .init(imageView: "homeCell7", titleText: "윤세 24AW"),
        .init(imageView: "homeCell8", titleText: "올해의 베스트"),
        .init(imageView: "homeCell9", titleText: "10월 베네핏"),
        .init(imageView: "homeCell10", titleText: "아크네 선물")
    ]
    
    /* 광고 배너 데이터, 1번째 섹션 데이터 */
    static let bannerData: [BannerModel] = [.init(imageView: "adverImage")]
}

/*
1. protocol의 역할:
 • 데이터 모델 간 공통 속성이나 **행동(메서드)**을 정의하는 청사진.
 • BannerModel과 RecommendProductModel은 둘 다 imageView라는 공통 속성을 가짐.
 • 이를 통해 모델을 일관되게 처리할 수 있음.
2. get과 get set:
 • get: 읽기만 가능한 속성을 요구.
 • get set: 읽기와 쓰기가 모두 가능한 속성을 요구.
3. RequiredCellProtocol의 의미:
 • imageView 속성을 필수로 구현해야 함.
 • 이를 채택한 BannerModel과 RecommendProductModel은 각각 자신의 방식으로 이 속성을 구현.
4. 장점:
 • 일관성: 여러 데이터 모델에서 공통 속성을 강제.
 • 유연성: RequiredCellProtocol 타입으로 다양한 모델을 처리 가능.
 • 확장성: 새로운 모델 추가 시 프로토콜을 채택하면 쉽게 기존 코드에 통합 가능.
 
요약
protocol을 사용하여 BannerModel과 RecommendProductModel이 공통된 인터페이스를 제공하며, 코드 재사용성과 유지보수성을 향상시킴.
*/
