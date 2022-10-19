//
//  ViewController.swift
//  WeatherPublisher
//
//  Created by 전도균 on 2022/10/19.
//

import Combine
import UIKit

class ViewController: UIViewController {
    let temperatureLable = UILabel()
    let cityTextfield = UITextField()
    
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func textFieldNotification() {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: cityTextfield)
            .compactMap { ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) }
            .sink { text in
                print(text)
            }
            .store(in: &cancellables)
    }
    
}

extension ViewController {
    private func setUI() {
        [temperatureLable, cityTextfield].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        temperatureLable.text = "Label"
        temperatureLable.textAlignment = .center
        
        cityTextfield.layer.borderWidth = 0.5
        cityTextfield.layer.borderColor = UIColor.lightGray.cgColor
        
        NSLayoutConstraint.activate([
            temperatureLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLable.bottomAnchor.constraint(equalTo: cityTextfield.topAnchor, constant: -100),
            temperatureLable.widthAnchor.constraint(equalToConstant: 200),
            
            cityTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityTextfield.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cityTextfield.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
}
