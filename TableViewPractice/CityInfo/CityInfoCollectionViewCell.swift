//
//  CityInfoCollectionViewCell.swift
//  TableViewPractice
//
//  Created by Greed on 1/9/24.
//

import UIKit

class CityInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImageView.contentMode = .scaleToFill
        cityImageView.layer.cornerRadius = cityImageView.frame.height / 2
        
        cityName.font = .boldSystemFont(ofSize: 16)
        cityName.textAlignment = .center
        
        subLabel.font = .systemFont(ofSize: 12)
        subLabel.numberOfLines = 0
        subLabel.textColor = .systemGray
        subLabel.textAlignment = .center
        
    }
    
    func configureCell(item: City) {
        
        let link = URL(string: item.city_image)
        
        cityImageView.kf.setImage(with: link)
        
        cityName.text = "\(item.city_name) | \(item.city_english_name)"
        
        subLabel.text = item.city_explain
        
    }

}
