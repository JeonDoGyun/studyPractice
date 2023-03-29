//
//  SecondViewController.swift
//  SwiftSoup-Ex
//
//  Created by 전도균 on 2023/03/27.
//

import UIKit
import WebKit
import SwiftSoup

class SecondViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: .zero)
        webView.navigationDelegate = self
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        let url = URL(string: "https://coinness.com/")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.documentElement.outerHTML.toString()") { result, error in
            if let html = result as? String {
                do {
                    let doc: Document = try SwiftSoup.parse(html)
                    let body = doc.body()
                    print(body!)
                } catch {
                    print("Parsing Error")
                }
            }
        }
        print("done")
    }
}
