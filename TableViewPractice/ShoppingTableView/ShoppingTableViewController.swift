//
//  ShoppingTableViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/7/24.
//

import UIKit

struct ShoppingList {
    var item: String
    var favorite: Bool
}

class ShoppingTableViewController: UITableViewController {

    @IBOutlet var textFieldMaskingView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList: [ShoppingList] = [ShoppingList(item: "양말", favorite: false),
                                        ShoppingList(item: "칫솔", favorite: false),
                                        ShoppingList(item: "삼겹살", favorite: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setTopView()
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        shoppingList.append(ShoppingList(item: userTextField.text!, favorite: false))
        userTextField.text = ""
        
        tableView.reloadData()
        
        view.endEditing(true)
        
    }
    
    @IBAction func favoriteButtonClicked(_ sender: UIButton) {

        shoppingList[sender.tag].favorite.toggle()
        
        shoppingList.sort { $0.favorite && !$1.favorite}
        
        tableView.reloadData()

//        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.selectionStyle = .none
        
        cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        cell.checkButton.tintColor = .black
        
        cell.shoppingItemLabel.text = shoppingList[indexPath.row].item
        
        if shoppingList[indexPath.row].favorite {
            cell.favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            cell.favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        cell.favoriteButton.tintColor = .black
        cell.favoriteButton.tag = indexPath.row
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
        }
        tableView.reloadData()
        
    }


    func setTopView() {
        
        textFieldMaskingView.backgroundColor = .systemGray5
        textFieldMaskingView.layer.cornerRadius = 8
        
        titleLabel.text = "쇼핑"
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        
        userTextField.placeholder = "무엇을 구매하실 건가요?"
        userTextField.backgroundColor = .systemGray5
        userTextField.borderStyle = .none
        userTextField.layer.cornerRadius = 8
        
        addButton.backgroundColor = .systemGray4
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.cornerRadius = 8
        
    }
}
