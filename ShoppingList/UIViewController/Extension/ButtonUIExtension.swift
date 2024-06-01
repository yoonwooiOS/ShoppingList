//
//  ButtonUIExtention.swift
//  ShoppingList
//
//  Created by 김윤우 on 5/31/24.
//

import UIKit

 extension UIButton {
    
     func buttonUiDesing(imageName:String, imageTitle title:String, tintColor color: UIColor, conerRadius: CGFloat, backgroundColor bgcolor: UIColor) {
      
        self.setImage(.init(systemName: imageName), for: .normal)
         self.setTitle(title, for: .normal)
         self.backgroundColor = bgcolor
        self.tintColor = color
        self.layer.cornerRadius = conerRadius
    }
    
    
}
