//
//  CityWithSegmentCollectionViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/9/24.
//

import UIKit

protocol customCollectionViewProtocol {
    
    var cityList: [City] { get }
    var numberValueList: (titleLabelSize: CGFloat, spacingSize: CGFloat, NumberOfSpacing: CGFloat) { get set }
    
    func setTitleLabel()
    
}

protocol customSegmentProtocol {
    
    func setSegmentControl()
}

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
    // 저장 프로퍼티는 extension에 추가할 수 없음. 연산을 이용해야 함
    var numberValueList: (titleLabelSize: CGFloat, spacingSize: CGFloat, NumberOfSpacing: CGFloat) = (16, 20 ,3)

    
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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tmp.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityInfoCollectionViewCell", for: indexPath) as! CityInfoCollectionViewCell
        
        let item = tmp[indexPath.item]
        
        cell.configureCell(item: item)
        
        return cell
    }
    
}

extension CityWithSegmentCollectionView: customCollectionViewProtocol {
    
    func setTitleLabel() {
        titleLabel.text = "인기 도시"
        titleLabel.font = .boldSystemFont(ofSize: numberValueList.titleLabelSize)
        titleLabel.textAlignment = .center
    }
    
}

extension CityWithSegmentCollectionView {
    
    func configureCollectionView() {
        
        let xib = UINib(nibName: "CityInfoCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityInfoCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = numberValueList.spacingSize
        let cellWidth = UIScreen.main.bounds.width - spacing * numberValueList.NumberOfSpacing
        let cellHeight = UIScreen.main.bounds.height - spacing * numberValueList.NumberOfSpacing
        
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellHeight / 3)
        layout.scrollDirection = .vertical
        cityCollectionView.collectionViewLayout = layout
        
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
    }

}

extension CityWithSegmentCollectionView: customSegmentProtocol {
    
    func setSegmentControl() {
        
        // 처음 모든 세그먼츠 삭제
        segmentController.removeAllSegments()
        
        area.allCases.enumerated().forEach { (index, section) in
            segmentController.insertSegment(withTitle: section.rawValue, at: index, animated: false)
        }
        
        segmentController.selectedSegmentIndex = 0
    }
}
