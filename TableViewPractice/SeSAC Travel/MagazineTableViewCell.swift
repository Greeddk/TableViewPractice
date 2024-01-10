//
//  MagazineTableViewCell.swift
//  TableViewPractice
//
//  Created by Greed on 1/8/24.
//

import UIKit

protocol customMagazineViewCellProtocol {
    
    func setUIInCell()
    func changeDateFormat(date: String) -> String
    func configureCell(item: Magazine)
}

class MagazineTableViewCell: UITableViewCell {
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUIInCell()
    }
    
}

extension MagazineTableViewCell: customMagazineViewCellProtocol {
    
    func setUIInCell() {
        
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.layer.cornerRadius = 10
        
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 2
        
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = .systemGray
        
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .systemGray
        
    }
    
    func changeDateFormat(date: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
        
        let dateTypeData = formatter.date(from: date)
        
        let strFormatter = DateFormatter()
        strFormatter.dateFormat = "yy년 MM월 dd일"
        
        let result = strFormatter.string(from: dateTypeData!)
        return result
        
    }
    
    func configureCell(item: Magazine) {
        
        let url = URL(string: item.photo_image)
        
        mainImageView.kf.setImage(with: url)
        
        titleLabel.text = item.title
        
        subtitleLabel.text = item.subtitle
        
        let result = changeDateFormat(date: item.date)
        dateLabel.text = result
    }
    
}
