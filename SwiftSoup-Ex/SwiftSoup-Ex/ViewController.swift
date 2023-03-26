//
//  ViewController.swift
//  SwiftSoup-Ex
//
//  Created by 전도균 on 2023/03/26.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {
    
    let address = "https://coinness.com"
    let textLabel = UILabel()
    
    let convertBtn = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        print("x")
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
                let doc = try SwiftSoup.parse(html!)
                let title = try doc.body()?.text()
                
                // <div class="sc-liQGml dgAUFu"><img src="/static/media/calendar.65079d48713c0622368d6d1a42045c1b.svg" class="sc-eJKXev jlEViU pc-only">오늘, 2023년 3월 26일 일요일</div>
                
                DispatchQueue.main.async { [self] in
                    textLabel.text = title
                }
                
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
