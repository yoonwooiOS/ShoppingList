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
    
    
    @IBOutlet var starButton: UIButton!
    
    
    @IBOutlet var bgView: UIView!
    
    var item: Item?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.backgroundColor = .systemGray6
        bgView.layer.cornerRadius = 10
        
        
        
    }
    
    func configureCell(data:Item) {
        
        self.item = data
        addShoppingLabel.textLabel(data.name, textSize: 12, backgroundColor: .systemGray6)
     
        let checkmarkImageName = data.checkmark ? "checkmark.square.fill" : "checkmark.square"
        let bookmarkImageName = data.bookmark ? "star.fill" : "star"
      
        checkMarkButton.buttonUiDesing(imageName: checkmarkImageName, imageTitle: "", tintColor: .black, conerRadius: 0, backgroundColor: .clear)
        
        starButton.buttonUiDesing(imageName: bookmarkImageName, imageTitle: "", tintColor: .black, conerRadius: 0, backgroundColor: .clear)

    }
    
    
    
}
