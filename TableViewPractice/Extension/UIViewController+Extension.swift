//
//  UIViewController+Extension.swift
//  TableViewPractice
//
//  Created by Greed on 1/10/24.
//

import UIKit

protocol reusableProtocol {
    
    static var identifier: String { get }
}

extension UIViewController: reusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
