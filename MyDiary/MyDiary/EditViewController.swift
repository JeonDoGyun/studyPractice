//
//  EditViewController.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/09.
//

import UIKit

class EditViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

}

extension EditViewController {
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        label.text = "여기서 편집"
    }
}
