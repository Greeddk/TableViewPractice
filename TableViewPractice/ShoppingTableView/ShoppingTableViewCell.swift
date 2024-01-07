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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shoppingListMaskingView.backgroundColor = .systemGray5
        shoppingListMaskingView.layer.cornerRadius = 8
        
    }
    
}
