//
//  DetailViewController.swift
//  BlogReader
//
//  Created by Jha, Vasudha on 16/05/18.
//  Copyright © 2018 Jha, Vasudha. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

 
    @IBOutlet weak var blogView: WKWebView!
    
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
                self.navigationItem.title = detail.value(forKey: "title") as? String
            if let webView = self.blogView {
                webView.loadHTMLString(detail.value(forKey: "content") as! String, baseURL: nil)
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

