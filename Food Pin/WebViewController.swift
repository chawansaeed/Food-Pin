//
//  WebViewController.swift
//  Food Pin
//
//  Created by Chawan Saeed on 11/23/20.
//  Copyright © 2020 Chawan Saeed. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = NSURL(string: "https://www.appcoda.com/contact" )
          {
        let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        
        }
    }
//      "https://www.appcoda.com/contact")
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
 
    
    
    
    
    
    
    
    
    
    
}
