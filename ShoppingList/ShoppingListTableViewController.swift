//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by 김윤우 on 5/24/24.
//

import UIKit


struct Shopping {
    
    var shoppingList:String
    var checkmark:Bool
    var bookmark:Bool
}



class ShoppingListTableViewController: UITableViewController {
    @IBOutlet var shoppingListLabel: UILabel!
    
    @IBOutlet var subView: UIView!
    
    @IBOutlet var addListTexfield: UITextField!
    
    @IBOutlet var addListButton: UIButton!
    
    var shoppingList = [
        Shopping(shoppingList: "그립톡 구매하기", checkmark: true, bookmark: false),
        Shopping(shoppingList: "사이다 구매하기", checkmark: true, bookmark: false),
        Shopping(shoppingList: "아이패드 케이스 최저가 알아보기", checkmark: true, bookmark: false),
        Shopping(shoppingList: "양말", checkmark: true, bookmark: false),
        
    ]
    
    var cellsColor = UIColor.systemGray6
    override func viewDidLoad() {
        super.viewDidLoad()
        // 셀 사이 구분선
        shoppingListLabel.text = "쇼핑"
        
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemGray2
        tableView.rowHeight = 44
        
        subView.backgroundColor = cellsColor
        addListTexfield.placeholder = "무엇을 구매하실 건가요?"
        addListTexfield.backgroundColor = cellsColor
        addListTexfield.borderStyle = .none
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: addListTexfield.frame.height))
//        addListTexfield.leftView = paddingView
//        addListTexfield.leftViewMode = .always

        
        
        addListButton.setTitle("추가", for: .normal)
        addListButton.tintColor = .black
        addListButton.backgroundColor = .systemGray4
        addListButton.layer.cornerRadius = 3
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return shoppingList.count
        } else if section == 1 {
            return shoppingList.count
        }
        
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListCell", for: indexPath) as! ShoppingListTableViewCell
        
        let data = shoppingList[indexPath.row]
        cell.layer.cornerRadius = 3
        cell.backgroundColor = cellsColor
        cell.shoppinglistLabel.text = data.shoppingList
        cell.shoppinglistLabel.textColor = .black
        
        cell.checkmarkImage.tintColor = .black
        let checkmarkState = data.checkmark ? "checkmark.square.fill" : "square"
        cell.checkmarkImage.setImage(UIImage(systemName: checkmarkState), for: .normal)
        cell.checkmarkImage.tag = indexPath.row
        cell.checkmarkImage.addTarget(self, action: #selector(checkmarkButtonClicked(_:)), for: .touchUpInside)
        
        let bookmarkState = data.bookmark ? "star.fill" : "star"
        cell.bookmarkImage.tintColor = .black
        cell.bookmarkImage.setImage(UIImage(systemName: bookmarkState), for: .normal)
        cell.bookmarkImage.tag = indexPath.row
        cell.bookmarkImage.addTarget(self, action: #selector(bookmarkButtonClicked(_:)), for: .touchUpInside)

        return cell
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        guard let text = addListTexfield.text, !text.isEmpty else {
            print("아무것도 입력안함")
            return
        }
        
        // 새로운 항목 추가
        let newItem = Shopping(shoppingList: text, checkmark: false, bookmark: false)
        shoppingList.append(newItem)
        tableView.reloadData()
        addListTexfield.text = ""
        
    }
    @objc func checkmarkButtonClicked(_ sender: UIButton) {
        
        let index = sender.tag
        shoppingList[index].checkmark.toggle()
        print(sender.tag, "checkmark")
        tableView.reloadData()
        
    }
    
    @objc func bookmarkButtonClicked(_ sender: UIButton) {
        
        let index = sender.tag
        shoppingList[index].bookmark.toggle()
        print(sender.tag, "bookmark")
        tableView.reloadData()
    }
    
    
}
