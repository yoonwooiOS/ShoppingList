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
    
    var shoppingList: [Item] = ShoppingITems().shoppingList {
        didSet {
            
            tableView.reloadData()
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
       
        addShoppingListButton.setTitle("추가", for: .normal)
        addShoppingListButton.tintColor = .black
        addShoppingListButton.backgroundColor = .systemGray5
        addShoppingListButton.layer.cornerRadius = 10
        
        addShoppingListTextField.placeholder = "무엇을 구해마실 건가요?"
        addShoppingListTextField.backgroundColor = .systemGray6
        addShoppingListTextField.addLeftPadding()
        addShoppingListTextField.layer.cornerRadius = 10
        addShoppingListTextField.borderStyle = .none
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopListTableViewCell") as! ShopListTableViewCell

        let data = shoppingList[indexPath.row]
        cell.configureCell(data: data)
        return cell
    }
    
    @IBAction func addShoppingListButtonClicked(_ sender: UIButton) {
        
        addNewItem()
    
    }
    
    @IBAction func addShoppingListTextField(_ sender: UITextField) {
        
        view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addNewItem()
        
        return true
    }
    
    
    func addNewItem() {
        guard let item = addShoppingListTextField.text, !item.isEmpty else { return }
      
        let newItem = Item(name: item, checkmark: false, bookmark: false)
        
        shoppingList.append(newItem)
        
    }
        
       
}
