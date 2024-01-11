//
//  CityInfoListViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/11/24.
//

import UIKit

class CityInfoListViewController: UIViewController {

    static var identifier = "CityInfoListViewController"
    
    var travelInfoList = TravelInfo().travel
    
    @IBOutlet var cityInfoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
        configureTableView()
    }

    @objc func leftBarItemClicked() {
        navigationController?.popViewController(animated: true)
    }

}

extension CityInfoListViewController { //UI
    
    func setNavigation() {
        
        navigationItem.title = "도시 상세 정보"
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(leftBarItemClicked))
        backButton.tintColor = .gray
        navigationItem.leftBarButtonItem = backButton
    }
    
    func configureTableView() {
        
        cityInfoListTableView.delegate = self
        cityInfoListTableView.dataSource = self
        
        let xib = UINib(nibName: CityInfoListTableViewCell.identifier, bundle: nil)
        cityInfoListTableView.register(xib, forCellReuseIdentifier: CityInfoListTableViewCell.identifier)
        
        let xibAD = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        cityInfoListTableView.register(xibAD, forCellReuseIdentifier: ADTableViewCell.identifier)
    }
    
}


extension CityInfoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if travelInfoList[indexPath.row].ad {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier) as! ADTableViewCell
            
            cell.configureADCell(item: travelInfoList[indexPath.row])
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CityInfoListTableViewCell.identifier, for: indexPath) as! CityInfoListTableViewCell
            
            cell.configureCityInfoCell(item: travelInfoList[indexPath.row])
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if travelInfoList[indexPath.row].ad {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: ADDetailViewController.identifier) as! ADDetailViewController
            vc.modalPresentationStyle = .fullScreen
            
            present(vc, animated: true)
            
        } else {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: CityDetailViewController.identifier) as! CityDetailViewController
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
}
