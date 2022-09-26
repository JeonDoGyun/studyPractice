//
//  MainViewController2.swift
//  CleanMyCloset
//
//  Created by 전도균 on 2022/09/25.
//

import UIKit
import Firebase

class MainViewController2: UIViewController {
    
    let welcomeLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
        let email = Auth.auth().currentUser?.email ?? "User"
        welcomeLabel.text = """
        환영합니다.
        \(email)님
        """
        
        
    }
    
}
