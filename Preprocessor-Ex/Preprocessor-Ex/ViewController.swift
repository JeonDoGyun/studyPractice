//
//  ViewController.swift
//  Preprocessor-Ex
//
//  Created by 전도균 on 2022/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    var server = ""

    // 전처리
    override func viewDidLoad() {
        super.viewDidLoad()
        #if TEST
        server = "Server Test"
        #elseif DEBUG // debug server
        server = "Server 3"
        #elseif QA // QA server
        server = "Server QA"
        #else // release server
        server = "Server 10"

        #endif
        print(server)
        
    }
}

