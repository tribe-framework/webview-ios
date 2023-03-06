//
//  ViewController.swift
//  webview-ios
//
//  Created by Niharika on 07/03/23.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let webView: WKWebView = {
    let prefs = WKWebpagePreferences()
    prefs.allowsContentJavaScript = true
    let configuration = WKWebViewConfiguration()
    configuration.defaultWebpagePreferences = prefs
    
        let webView = WKWebView(frame: .zero,
                                configuration: configuration)
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 255/255, green: 51/255, blue: 153/255, alpha: 1)
        view.addSubview(webView)
        
        guard let url = URL(string: "https://tribe-framework.org") else {
            return
        }
        
        webView.scrollView.isScrollEnabled = false
        
        //to prevent white flashing
        webView.isOpaque = false
        webView.backgroundColor = UIColor.init(red: 255/255, green: 51/255, blue: 153/255, alpha: 1)
        
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

