//
//  ViewController.swift
//  URLSession-Starter
//
//  Created by 전도균 on 2022/08/31.
//

import UIKit

class ViewController: UIViewController {
    
    let temperatureLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        NetworkService.shared.fetch(urlString: URL.weather) { weatherInfo in
            self.temperatureLabel.text = weatherInfo.weather.first?.main
        }
    }
}

extension ViewController {
    
    private func setUI() {
        temperatureLabel.text = "0"
        view.addSubview(temperatureLabel)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
