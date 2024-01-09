//
//  CityWithSegmentCollectionViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/9/24.
//

import UIKit

enum area: String, CaseIterable {
    case all = "모두"
    case domestic = "국내"
    case abroad = "해외"
}

class CityWithSegmentCollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var segmentController: UISegmentedControl!
    @IBOutlet var cityCollectionView: UICollectionView!
    
    var cityList = CityInfo().city
    var tmp: [City] = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitleLabel()
        setSegmentControl()
        configureCollectionView()
    }
    
    @IBAction func segmentClicked(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            tmp = cityList
        case 1:
            tmp = cityList.filter{ $0.domestic_travel }
        case 2:
            tmp = cityList.filter{ !$0.domestic_travel}
        default:
            print("error")
        }
        
        cityCollectionView.reloadData()
    }
    
    func configureCollectionView() {
        
        let xib = UINib(nibName: "CityInfoCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityInfoCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let cellWidth = UIScreen.main.bounds.width - spacing * 3
        let cellHeight = UIScreen.main.bounds.height - spacing * 3
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellHeight / 3)
        layout.scrollDirection = .vertical
        cityCollectionView.collectionViewLayout = layout
        
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tmp.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityInfoCollectionViewCell", for: indexPath) as! CityInfoCollectionViewCell
        
        let item = tmp[indexPath.item]
        
        cell.configureCell(item: item)
        
        return cell
    }
    
    func setTitleLabel() {
        titleLabel.text = "인기 도시"
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
    }

    func setSegmentControl() {
        
        // 처음 모든 세그먼츠 삭제
        segmentController.removeAllSegments()
        
        area.allCases.enumerated().forEach { (index, section) in
            segmentController.insertSegment(withTitle: section.rawValue, at: index, animated: false)
        }
        
        segmentController.selectedSegmentIndex = 0
    }
    
}
