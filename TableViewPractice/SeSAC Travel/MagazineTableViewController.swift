//
//  MagazineTableViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/8/24.
//

import UIKit
import Kingfisher

protocol magazineViewProtocol {
    
    func configureTableView()
    func setTopView()

}

class MagazineTableViewController: UITableViewController {
    
    @IBOutlet var appTitle: UILabel!
    
    let magazine = MagazineInfo().magazine
    
    var rowHeightSize: CGFloat = 450

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        setTopView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return magazine.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell", for: indexPath) as! MagazineTableViewCell
        
        cell.selectionStyle = .none
        
        let item = magazine[indexPath.item]
        cell.configureCell(item: item)
        
        return cell
    }


}

extension MagazineTableViewController: magazineViewProtocol {
    
    func configureTableView() {
        
        tableView.rowHeight = rowHeightSize
        tableView.separatorStyle = .none
    }
    
    func setTopView() {
        
        appTitle.text = "SeSAC TRAVEL"
        appTitle.font = .boldSystemFont(ofSize: 20)
        appTitle.textAlignment = .center
        
    }
    
}
