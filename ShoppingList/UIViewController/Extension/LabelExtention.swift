//
//  LabelExtention.swift
//  ShoppingList
//
//  Created by 김윤우 on 5/31/24.
//

import UIKit

extension UILabel {
    
    func textLabel(_ text:String, textSize size:Int, backgroundColor bgColor: UIColor ) {
        self.text = text
        self.textAlignment = .left
        self.numberOfLines = 1
        self.font = .boldSystemFont(ofSize: CGFloat(size))
        self.backgroundColor = bgColor
        self.layer.cornerRadius = 10
    }
    
    
}
