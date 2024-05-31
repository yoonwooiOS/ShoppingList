//
//  Shopping.swift
//  ShoppingList
//
//  Created by 김윤우 on 5/31/24.
//

import Foundation

struct Item {
    
    var name:String
    var checkmark:Bool
    var bookmark:Bool
}

struct shopping {
    
    static let shoppingList:[Item] = [
    
        Item(name: "그립톡 구매하기", checkmark: false, bookmark: false),
        Item(name: "사이다 구매하기", checkmark: false, bookmark: false),
        Item(name: "아이패드 케이스 최저가 알아보기", checkmark: false, bookmark: false),
        Item(name: "양말", checkmark: false, bookmark: false),
    
    ]
    
}
