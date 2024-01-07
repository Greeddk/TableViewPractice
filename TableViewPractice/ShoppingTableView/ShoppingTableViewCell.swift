//
//  ShoppingTableViewCell.swift
//  TableViewPractice
//
//  Created by Greed on 1/7/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var shoppingItemLabel: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    
    @IBOutlet var shoppingListMaskingView: UIView!
    
    var isClicked = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shoppingListMaskingView.backgroundColor = .systemGray5
        shoppingListMaskingView.layer.cornerRadius = 8
        
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        
        isClicked.toggle()
        
        if isClicked {
            checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            
            shoppingItemLabel.textColor = .systemGray
        } else {
            checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            
            shoppingItemLabel.textColor = .black
        }
    }
    
    
}
