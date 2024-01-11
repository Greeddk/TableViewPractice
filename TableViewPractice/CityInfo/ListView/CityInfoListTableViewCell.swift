//
//  CityInfoListTableViewCell.swift
//  TableViewPractice
//
//  Created by Greed on 1/11/24.
//

import UIKit
import Kingfisher

class CityInfoListTableViewCell: UITableViewCell {

    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var starImage: [UIImageView]!
    
    @IBOutlet var placeImage: UIImageView!
    @IBOutlet var isFavorite: UIImageView!
    
    @IBOutlet var favoriteCount: UILabel!
    
    static var identifier = "CityInfoListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }

}

extension CityInfoListTableViewCell {
    
    func setUI() {
        
        placeLabel.font = .boldSystemFont(ofSize: 16)
        
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 2
        descriptionLabel.font = .systemFont(ofSize: 12)
        
        favoriteCount.textColor = .systemGray
        favoriteCount.font = .systemFont(ofSize: 12)
        
        placeImage.layer.cornerRadius = 10
        placeImage.clipsToBounds = true
        placeImage.contentMode = .scaleAspectFill
        
        isFavorite.tintColor = .white
    }
    
    func configureCityInfoCell(item: Travel) {
        
        placeLabel.text = item.title
        
        descriptionLabel.text = item.description
        
        let link = URL(string: item.travel_image ?? "")
        placeImage.kf.setImage(with: link)
        
        guard let score = item.grade else { return }
        setStarMark(score: score)
        
        guard let isHeart = item.like else { return }
        setHeartMark(isPreferred: isHeart)
        
        guard let item = item.save else { return }
        let randomNum = Int.random(in: 0...item)
        favoriteCount.text = "(\(randomNum)) . 저장 \(item)"
        
    }
    
    func setHeartMark(isPreferred: Bool) {
        
        if isPreferred {
            isFavorite.image = UIImage(systemName: "heart.fill")
            isFavorite.tintColor = .orange
        } else {
            isFavorite.image = UIImage(systemName: "heart")
            isFavorite.tintColor = .orange
        }
    }
    
    func setStarMark(score: Double) {
        
        let intScore = Int(round(score))
        
        for i in 0...4 {
            starImage[i].image = UIImage(systemName: "star.fill")
            starImage[i].tintColor = .systemGray5
        }
        
        for score in 0...intScore - 1 {
            starImage[score].tintColor = .orange
        }

    }
    
}
