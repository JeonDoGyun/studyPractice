//
//  ViewController.swift
//  Practice_Notion
//
//  Created by 전도균 on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = NetworkService.shared.getQuote { result in
            print("Escaping: \(result)")
        }
        print("Non-Escaping: \(result)")
        
    }
}

