//
//  ShopListTableViewCell.swift
//  ShoppingList
//
//  Created by 김윤우 on 5/31/24.
//

import UIKit

class ShopListTableViewCell: UITableViewCell {

    @IBOutlet var checkMarkButton: UIButton!
    
    @IBOutlet var addShoppingLabel: UILabel!
    
    
    @IBOutlet var addStarButton: UIButton!
    
    
    @IBOutlet var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.backgroundColor = .systemGray6
        bgView.layer.cornerRadius = 10
        
     
        
    }

    func configureCell(data:Item) {
        
        addShoppingLabel.textLabel(data.name, textSize: 12, backgroundColor: .systemGray6)
        let checkmark = data.checkmark ? "checkmark.square" : "checkmark.square.fill"
        let star = data.bookmark ? "star" : "star.fill"
        checkMarkButton.buttonUiDesing(imageName: checkmark, tintColor: .black)
        print(checkmark)
        addStarButton.buttonUiDesing(imageName: star, tintColor: .black)
    }
    
}
