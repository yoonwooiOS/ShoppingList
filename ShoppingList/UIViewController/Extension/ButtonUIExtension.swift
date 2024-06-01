//
//  ButtonUIExtention.swift
//  ShoppingList
//
//  Created by 김윤우 on 5/31/24.
//

import UIKit

extension UIButton {
    
    func buttonUiDesing(imageName:String, tintColor color: UIColor) {
      
        self.setImage(.init(systemName: imageName), for: .normal)
        self.tintColor = color
       
    }
    
    
}
