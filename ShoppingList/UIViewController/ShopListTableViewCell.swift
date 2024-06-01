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
    
    var item: Item?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView.backgroundColor = .systemGray6
        bgView.layer.cornerRadius = 10
        
     
        
    }

    func configureCell(data:Item) {
        
        self.item = data
        addShoppingLabel.textLabel(data.name, textSize: 12, backgroundColor: .systemGray6)
        let checkmark = data.checkmark ? "checkmark.square" : "checkmark.square.fill"
        let star = data.bookmark ? "star" : "star.fill"
        checkMarkButton.buttonUiDesing(imageName: checkmark, tintColor: .black)

        addStarButton.buttonUiDesing(imageName: star, tintColor: .black)
        
        checkButtonToggle(data: data)
    }
    
    
    @IBAction func checkmarkButtonClicked(_ sender: UIButton) {
        print(#function)
        item?.checkmark.toggle()
        checkButtonToggle(data: item!)
        
    }
    
    
    @IBAction func starButtonClicked(_ sender: UIButton) {
        item?.bookmark.toggle()
        starButtonToggle(data: item!)
        
    }
    
    func checkButtonToggle(data:Item) {
        let checkmark = data.checkmark ? "checkmark.square" : "checkmark.square.fill"
         checkMarkButton.buttonUiDesing(imageName: checkmark, tintColor: .black)
        
    }
    func starButtonToggle(data:Item) {
        
        let star = data.bookmark ? "star" :
"star.fill"
        addStarButton.buttonUiDesing(imageName: star, tintColor: .black)
    }
    
    
}
