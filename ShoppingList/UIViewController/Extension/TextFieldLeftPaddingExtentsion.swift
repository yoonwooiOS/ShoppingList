//
//  AddLeftPaddingExtentsion.swift
//  ShoppingList
//
//  Created by 김윤우 on 5/31/24.
//

import UIKit

extension UITextField {
    
    func addLeftPadding() {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
        
    }
}
