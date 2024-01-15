//
//  ADTableViewCell.swift
//  TableViewPractice
//
//  Created by Greed on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    @IBOutlet var adBackView: UIView!
    
    @IBOutlet var adSign: UILabel!
    @IBOutlet var adDescripLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        setUI()
    }

}

extension ADTableViewCell {
    
    func setUI() {
        
        adBackView.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 0.7)
        adBackView.layer.cornerRadius = 8
        
        adSign.backgroundColor = .white
        adSign.clipsToBounds = true
        adSign.layer.cornerRadius = 4
        adSign.text = "AD"
        adSign.textAlignment = .center
        adSign.font = .systemFont(ofSize: 12)
        
        adDescripLabel.font = .boldSystemFont(ofSize: 14)
        adDescripLabel.numberOfLines = 2
        adDescripLabel.textAlignment = .center
        
    }
    
    func configureADCell(item: Travel) {
        
        adDescripLabel.text = item.title
        
    }
}
