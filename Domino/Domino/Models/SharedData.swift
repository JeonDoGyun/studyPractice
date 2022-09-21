//
//  SharedData.swift
//  Domino
//
//  Created by 전도균 on 2022/09/21.
//

import Foundation

class SharedData {
    static let shared = SharedData()
    private init () {
        initCart = cart
    }
    
    // 공유할 데이터 목록
    var categoryName = "" // 카테고리 이름
    var menuName = "" // 제품 이름
    var price = 0
    
    // 버튼 카운트
    var count: Int {
        get {
            guard let menuList = cart[categoryName],
                  let quantity = menuList[menuName] else { fatalError() }
            return quantity
        }
        set {
            cart[categoryName]?[menuName] = newValue
            newValue == 0 ? removeItemFromWishList() : appendItemOnWishList(newValue: newValue)
        }
    }
    
    
    var cart = [
        "슈퍼시드": ["글램핑 바비큐": 0, "알로하 하와이안": 0, "우리 고구마": 0, "콰트로 치즈 퐁듀": 0],
        "프리미엄": ["더블크러스트 이베리코": 0, "블랙앵거스 스테이크": 0, "블랙타이거 슈림프": 0, "와규 앤 비스테카": 0, "직화 스테이크": 0],
        "클래식": ["베이컨체더치즈": 0, "불고기": 0, "슈퍼디럭스": 0, "슈퍼슈프림": 0, "페퍼로니": 0, "포테이토": 0],
        "사이드디시": ["딸기 슈크림": 0, "슈퍼곡물 치킨": 0, "애플 크러스트 디저트": 0, "치킨퐁듀 그라탕": 0, "퀴노아 치킨 샐러드": 0, "포테이토 순살치킨": 0],
        "음료": ["미닛메이드 스파클링 청포도": 0, "스프라이트": 0, "코카콜라 제로": 0, "코카콜라": 0],
        "피클소스": ["갈릭 디핑 소스": 0, "스위트 칠리소스": 0, "우리 피클 L": 0, "우리 피클 M": 0, "핫소스": 0]
    ]
    var initCart: [String : [String : Int]]
    var wishListItemNames: [String] = []
    var wishListItemQuantity: [Int] = []
    
    var orderMessage: String { generateReceipt() }
    
    func resetWishList() {
        wishListItemNames.removeAll()
        wishListItemQuantity.removeAll()
        cart = initCart
        price = 0
    }
}

extension SharedData {
    func removeItemFromWishList() {
        guard let index = wishListItemNames.firstIndex(of: menuName) else { return }
        wishListItemNames.remove(at: index)
        wishListItemQuantity.remove(at: index)
    }
    
    func appendItemOnWishList(newValue: Int) {
        wishListItemNames.contains(menuName)
            ? { guard let index = wishListItemNames.firstIndex(of: menuName) else { return }
                wishListItemQuantity[index] = newValue }()
            : { wishListItemNames.append(menuName)
                wishListItemQuantity.append(newValue) }() // wishList 에 아이템이 없을 품목 및 수량 추가
    }
    
    func generateReceipt() -> String {
        var result = ""
        for (menu, quantity) in zip(wishListItemNames, wishListItemQuantity) {
            result += "\(menu) - \(quantity)개\n"
        }
        result += "결제금액: \(price)원"
        return result
    }
}
