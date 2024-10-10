//
//  SavedItemModel.swift
//  KREAM
//
//  Created by KKM on 10/10/24.
//

import Foundation

struct SavedItemModel {
    let itemImage: String
    let itemTitle: String
    let itemDiscription: String
    let bookmarkImage: String
    let itemPrice: String
}

final class dummyItemModel {
    static let itemDatas: [SavedItemModel] = [
        SavedItemModel(itemImage: "KREAM-item1", itemTitle: "손오공이 잃어버린 머리띠 반쪽", itemDiscription: "손오공이 장난치다가 머리띠 반쪽 잘라서 어딘가 숨겨둔 역사속 물건!!", bookmarkImage: "KREAM-bookmark", itemPrice: "942,192,000원"),
        SavedItemModel(itemImage: "KREAM-item2", itemTitle: "골드 반지", itemDiscription: "결혼 준비하는 당신?!\n약혼녀에게 이 반지를 선물하는 건 어때요?!", bookmarkImage: "KREAM-bookmark", itemPrice: "12,000원"),
        SavedItemModel(itemImage: "KREAM-item3", itemTitle: "하얀 신발", itemDiscription: "짝퉁 나이키 신발!\n정말 푹신푹신해서 걷다가 졸려서 넘어지...", bookmarkImage: "KREAM-bookmark", itemPrice: "90,000원"),
        SavedItemModel(itemImage: "KREAM-item4", itemTitle: "에베레스트 다이아 반지", itemDiscription: "에베레스트 올라가서 다이아 구하고 만든 반지,,! 과연 이것을 누가 사갈것인가??", bookmarkImage: "KREAM-bookmark", itemPrice: "1,292,999,000원"),
        SavedItemModel(itemImage: "KREAM-item5", itemTitle: "아디다스다 신발", itemDiscription: "아디다스 처럼 보이지만 아디다스가 아닐지도 모르는 신발 이 신발의 주인은 너야~~", bookmarkImage: "KREAM-bookmark", itemPrice: "120,000원"),
        SavedItemModel(itemImage: "KREAM-item6", itemTitle: "황제 잠옷", itemDiscription: "어느 나라의 황제가 입었다던 잠옷 크리스마스 트리같이 보이는 디자인!", bookmarkImage: "KREAM-bookmark", itemPrice: "120,000,000원"),
        SavedItemModel(itemImage: "KREAM-item7", itemTitle: "고장난 기타", itemDiscription: "블라블라블라블라\n블라블라블라블라블라블라", bookmarkImage: "KREAM-bookmark", itemPrice: "120,000원"),
        SavedItemModel(itemImage: "KREAM-item8", itemTitle: "하얀 음료", itemDiscription: "이 음료를 마시면 건강해져요\n근데 어디가 건강해질까요? 한 번 마셔겠.....", bookmarkImage: "KREAM-bookmark", itemPrice: "120,000원"),
        SavedItemModel(itemImage: "KREAM-item9", itemTitle: "Ferrari 812 SuperFast", itemDiscription: "V12 / 자연흡기 / 6500cc / 800HP / 73.2kgm / 0-100: 2.9sec / max 340km/h", bookmarkImage: "KREAM-bookmark", itemPrice: "471,000,000원"),
        SavedItemModel(itemImage: "KREAM-item10", itemTitle: "Lamborghini Revuelto", itemDiscription: "V12 / 자연흡기 / 6500cc / 1015HP / 73.9kgm / 0-100: 2.5sec / max 350km/h", bookmarkImage: "KREAM-bookmark", itemPrice: "999,999,999,999원"),
        SavedItemModel(itemImage: "KREAM-item11", itemTitle: "롯데타워", itemDiscription: "Korea No.1", bookmarkImage: "KREAM-bookmark", itemPrice: "113,000,000,000,000원")
    ]
}
