//
//  CityInfoCollectionViewCell.swift
//  TableViewPractice
//
//  Created by Greed on 1/9/24.
//

import UIKit

protocol customCollectionViewCell {
    func setUIInCell()
    func configureCell(item: City)
}

class CityInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    var cellNumberValue: (cityNameSize: CGFloat, subLabelSize: CGFloat) = (16, 12)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       setUIInCell()
        
    }

}

extension CityInfoCollectionViewCell: customCollectionViewCell {
    
    func setUIInCell() {
        cityImageView.contentMode = .scaleToFill
        
        DispatchQueue.main.async {
            self.cityImageView.layer.cornerRadius = self.cityImageView.frame.height / 2
        }
        
        cityName.font = .boldSystemFont(ofSize: cellNumberValue.cityNameSize)
        cityName.textAlignment = .center
        
        subLabel.font = .systemFont(ofSize: cellNumberValue.subLabelSize)
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
