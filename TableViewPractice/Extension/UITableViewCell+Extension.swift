//
//  UITableViewCell+Extension.swift
//  TableViewPractice
//
//  Created by Greed on 1/15/24.
//

import UIKit

extension UITableViewCell: reusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
