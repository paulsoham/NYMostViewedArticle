//
//  DetailViewController.swift
//  MostViewedInNYTimes
//
//  Created by apple on 08/03/18.
//  Copyright © 2018 Soham Paul. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!

    
    func configureView() {
        
        let navColor = UIColor(red: 0.0/255.0, green: 228.0/255.0, blue: 196.0/255.0, alpha: 1.0)

        if let navContr = self.navigationController {
            navContr.navigationBar.barTintColor = navColor
        }
        
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        if let detail = detailItem {
            navigationItem.title = detail.title

            webView = WKWebView()
            webView.navigationDelegate = self
            view = webView
            
            
            let url = detail.url!
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
            
        }
        
      
        
       
    }
    
    //MARK:- WKNavigationDelegate
    
    private func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start to load")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load")
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
    
  

    var detailItem: NYArticles? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

