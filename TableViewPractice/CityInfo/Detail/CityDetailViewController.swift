//
//  CityDetailViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/11/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    @IBOutlet var cityDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityDetailLabel.font = .boldSystemFont(ofSize: 40)
        cityDetailLabel.text = "관광지 화면"
        
        navigationItem.title = "관광지 화면"
    }

}
