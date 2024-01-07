//
//  SettingTableViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/7/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    @IBOutlet var titleLabel: UILabel!
    
    var list: [[String]] = [["공지사항","실험실","버전 정보"], ["개인/보안","알림","채팅","멀티프로필"],["고객센터/도움말"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "설정"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 16)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        
        for i in 0...list.count - 1 {
            if indexPath.section == i {
                cell.settingLabel.text = list[i][indexPath.row]
                cell.settingLabel.font = .systemFont(ofSize: 12)
            }
        }
            
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else {
            return "기타"
        }
    }
    
}
