//
//  ShopListViewController.swift
//  ShoppingList
//
//  Created by 김윤우 on 5/31/24.
//

import UIKit

class ShopListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UITextFieldDelegate {
   
    @IBOutlet var addShoppingListTextField: UITextField!
    
    @IBOutlet var addShoppingListButton: UIButton!
    
    
    @IBOutlet var tableView: UITableView!
    
    var shoppingList: [Item] = ShoppingITems().shoppingList
    
    var finalShoppingList:[Item] = [] {
        didSet {
            
            tableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        finalShoppingList = shoppingList
        configureTabeVeiw()
        configureLayout()
    }
    
    func configureTabeVeiw() {
        
        tableView.rowHeight = 60
       
        let xib = UINib(nibName: "ShopListTableViewCell", bundle: nil)
        
        tableView.register(xib, forCellReuseIdentifier: "ShopListTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        addShoppingListTextField.delegate = self
    }
    
    func configureLayout() {
        
        addShoppingListButton.buttonUiDesing(imageName: "", imageTitle: "추가", tintColor: .black, conerRadius: 10, backgroundColor: .systemGray5)
        
        addShoppingListTextField.placeholder = "무엇을 구해마실 건가요?"
        addShoppingListTextField.backgroundColor = .systemGray6
        addShoppingListTextField.addLeftPadding()
        addShoppingListTextField.layer.cornerRadius = 10
        addShoppingListTextField.borderStyle = .none
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return finalShoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopListTableViewCell") as! ShopListTableViewCell
        
        let data = finalShoppingList[indexPath.row]
        cell.configureCell(data: data)
        
        cell.checkMarkButton.tag = indexPath.row
        cell.checkMarkButton.addTarget(self, action: #selector(checkmarkButtonClicked), for: .touchUpInside)
        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @IBAction func addShoppingListButtonClicked(_ sender: UIButton) {
        
        addNewItem()
        addShoppingListTextField.text = ""
    }
    
    @IBAction func addShoppingListTextField(_ sender: UITextField) {
        
        view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        addNewItem()
        addShoppingListTextField.text = ""
        return true
    }
    
    
    func addNewItem() {
        guard let item = addShoppingListTextField.text, !item.isEmpty else { return }
      
        let newItem = Item(name: item, checkmark: false, bookmark: false)
        
        finalShoppingList.append(newItem)
        
    }
    
    @objc func checkmarkButtonClicked(_ sender:UIButton) {
        
        let index = sender.tag
        
        finalShoppingList[index].checkmark.toggle()
        
    }
    
    @objc func starButtonClicked(_ sender:UIButton) {
        
        let index = sender.tag
        
        finalShoppingList[index].bookmark.toggle()
    }
}
