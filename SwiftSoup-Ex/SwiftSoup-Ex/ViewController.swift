//
//  ViewController.swift
//  SwiftSoup-Ex
//
//  Created by 전도균 on 2023/03/26.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {
    
    let address = "https://www.coinness.com/"
    let textLabel = UILabel()
    
    private let titleArray: [String] = []
    
    let convertBtn = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        getTitle()
        view.backgroundColor = .white
        view.addSubview(textLabel)
        view.addSubview(convertBtn)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        convertBtn.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "Nothing"
        convertBtn.setTitle("Convert", for: .normal)
        convertBtn.addTarget(self, action: #selector(didTappedConvertBtn(_:)), for: .touchUpInside)
        convertBtn.backgroundColor = .white
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            convertBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            convertBtn.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 50)
        ])
    }

}

extension ViewController {
    private func getTitle() {
        guard let url = URL(string: address) else { fatalError("Invalid URL") }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching website data : \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                let html = String(data: data, encoding: .utf8)
                let doc: Document = try SwiftSoup.parse(html!)
                let body = try doc.select("div#root")
                print(body)
                
//                let newsItems = try doc.select("div.news-item")
//                
//                for newsItem in newsItems {
//                    let title = try newsItem.select("h2").text()
//                    let summary = try newsItem.select("p").text()
//                    let link = try newsItem.select("a").attr("href")
//                    
//                    print(title)
//                    print(summary)
//                    print(link)
//                    print("done")
//                    
//                }
            } catch {
                print("Error parsing HTML")
            }
        }.resume()
    }
    
    @objc
    private func didTappedConvertBtn(_ sender: UIButton) {
        getTitle()
    }
}
