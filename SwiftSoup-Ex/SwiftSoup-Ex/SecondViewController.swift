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
    var websiteDataStore: WKWebsiteDataStore!
    var timer: Timer?
    let timeInterval: TimeInterval = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let configuration = WKWebViewConfiguration()
        websiteDataStore = WKWebsiteDataStore.nonPersistent()
        configuration.websiteDataStore = websiteDataStore
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = self
        
        let url = URL(string: "https://coinness.com/")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: timeInterval)
        webView.load(request)
        
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false, block: { [weak self] _ in
            guard self != nil else { return }
            webView.stopLoading()
            self?.timer?.invalidate()
            self?.timer = nil
        })
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        timer?.invalidate()
        timer = nil
        DispatchQueue.main.async {
            webView.evaluateJavaScript("document.documentElement.outerHTML.toString()") { (result, error) in
                if let html = result as? String {
                    do {
                        let doc: Document = try SwiftSoup.parse(html)
                        let body = try? doc.body()?.outerHtml()
                        print(body!)
                    } catch {
                        print("Parsing Error")
                    }
                }
            }
        }
        print("done")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        timer?.invalidate()
        timer = nil
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
        
        websiteDataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), modifiedSince: .distantPast) {
            print("Website Data deleted")
        }
    }
}
