//
//  ADDetailViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/11/24.
//

import UIKit

class ADDetailViewController: UIViewController {

    @IBOutlet var adTextLabel: UILabel!
    @IBOutlet var dismissButton: UIButton!
    
    static let identifier = "ADDetailViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adTextLabel.font = .boldSystemFont(ofSize: 40)
        adTextLabel.text = "광고 화면"
        
        dismissButton.setImage(UIImage(systemName: "x.circle"), for: .normal)
        
        navigationItem.title = "광고 화면"
    }
    
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        
        dismiss(animated: true)
    }
    
}
