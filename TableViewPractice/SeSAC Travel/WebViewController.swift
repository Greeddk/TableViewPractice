//
//  WebViewController.swift
//  TableViewPractice
//
//  Created by Greed on 1/15/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var webView: WKWebView!
    
    var item: Magazine = Magazine(title: "", subtitle: "", photo_image: "", date: "", link: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setWebView()
    }
    
}

extension WebViewController {
    
    func setWebView() {
        
        if let url = URL(string: item.link!) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
