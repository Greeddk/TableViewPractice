//
//  MagazineTableViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/8/24.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    
    @IBOutlet var appTitle: UILabel!
    
    let magazine = MagazineInfo().magazine

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 450
        tableView.separatorStyle = .none
        setTopView()
    }

    // MARK: - Table view data source

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
        
        let url = URL(string: magazine[indexPath.row].photo_image)
        cell.mainImageView.kf.setImage(with: url)
        cell.mainImageView.contentMode = .scaleAspectFill
        cell.mainImageView.layer.cornerRadius = 10
        
        cell.titleLabel.text = magazine[indexPath.row].title
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.numberOfLines = 2
        
        cell.subtitleLable.text = magazine[indexPath.row].subtitle
        cell.subtitleLable.font = .systemFont(ofSize: 14)
        cell.subtitleLable.textColor = .systemGray
        
        let result = changeDateFormat(date: magazine[indexPath.row].date)
        cell.dateLabel.text = result
        cell.dateLabel.font = .systemFont(ofSize: 12)
        cell.dateLabel.textColor = .systemGray
        
        return cell
    }
    
    func setTopView() {
        
        appTitle.text = "SeSAC TRAVEL"
        appTitle.font = .boldSystemFont(ofSize: 20)
        appTitle.textAlignment = .center
        
    }
    
    func changeDateFormat(date: String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
        
        let dateTypeData = formatter.date(from: date)
        
        let strFormatter = DateFormatter()
        strFormatter.dateFormat = "yy년 MM월 dd일"
        
        let result = strFormatter.string(from: dateTypeData!)
        return result
        
    }
   

}
