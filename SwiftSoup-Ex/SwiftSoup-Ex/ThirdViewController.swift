//
//  ThirdViewController.swift
//  SwiftSoup-Ex
//
//  Created by 전도균 on 2023/03/28.
//

import UIKit
import PythonKit

class ThirdViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let sys = Python.import("sys")

        print("Python \(sys.version_info.major).\(sys.version_info.minor)")
        print("Python Version: \(sys.version)")
        print("Python Encoding: \(sys.getdefaultencoding().upper())")
        
    }
}
