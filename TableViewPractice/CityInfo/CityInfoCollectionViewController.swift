//
//  CityInfoCollectionViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/9/24.
//

import UIKit
import Kingfisher

class CityInfoCollectionViewController: UICollectionViewController {
    
    let cityList = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xib = UINib(nibName: "CityInfoCollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "CityInfoCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let cellWidth = UIScreen.main.bounds.width - spacing * 3
        let cellHeight = UIScreen.main.bounds.height - spacing * 3
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellHeight / 3)
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityInfoCollectionViewCell", for: indexPath) as! CityInfoCollectionViewCell
        
        let item = cityList[indexPath.item]
        
        cell.configureCell(item: item)
        
        return cell
    }

}
