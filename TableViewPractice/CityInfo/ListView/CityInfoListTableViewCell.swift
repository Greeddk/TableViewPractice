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
    
    @IBOutlet var star1: UIImageView!
    @IBOutlet var star2: UIImageView!
    @IBOutlet var star3: UIImageView!
    @IBOutlet var star4: UIImageView!
    @IBOutlet var star5: UIImageView!
    
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
        
        star1.image = UIImage(systemName: "star.fill")
        star1.tintColor = .orange
        star2.image = UIImage(systemName: "star.fill")
        star2.tintColor = .orange
        star3.image = UIImage(systemName: "star.fill")
        star3.tintColor = .orange
        star4.image = UIImage(systemName: "star.fill")
        star4.tintColor = .orange
        star5.image = UIImage(systemName: "star.fill")
        star5.tintColor = .orange
        
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
        } else {
            isFavorite.image = UIImage(systemName: "heart")
        }
    }
    
    func setStarMark(score: Double) {
        
        let intScore = Int(round(score))
        
        switch intScore {
        case 1:
            star2.tintColor = .systemGray5
            star3.tintColor = .systemGray5
            star4.tintColor = .systemGray5
            star5.tintColor = .systemGray5
        case 2:
            star3.tintColor = .systemGray5
            star4.tintColor = .systemGray5
            star5.tintColor = .systemGray5
        case 3:
            star4.tintColor = .systemGray5
            star5.tintColor = .systemGray5
        case 4:
            star5.tintColor = .systemGray5
        case 5:
            star1.tintColor = .orange
            star2.tintColor = .orange
            star3.tintColor = .orange
            star4.tintColor = .orange
            star5.tintColor = .orange
        default:
            star1.tintColor = .systemGray5
            star2.tintColor = .systemGray5
            star3.tintColor = .systemGray5
            star4.tintColor = .systemGray5
            star5.tintColor = .systemGray5
        }

        
    }
    
}
