//
//  ViewController.swift
//  Toggle_darkMode
//
//  Created by 전도균 on 2023/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel = UILabel()
    let toggleSwitch = UISwitch()
    
    let userDefaults = UserDefaults.standard
    
    var isOn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
        
        isOn = userDefaults.bool(forKey: "switchState")
        updateToggle()
    }
    
    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(toggleSwitch)
        
        titleLabel.text = "다크 모드"
        toggleSwitch.addTarget(self, action: #selector(handledSwitch(_:)), for: .valueChanged)
    }
    
    func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            
            toggleSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            toggleSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            toggleSwitch.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    func updateToggle() {
        // 해당 뷰뿐만 아니라 앱 전체 인터페이스를 바꾸고 싶을 경우 이렇게 사용
        if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if #available(iOS 15.0, *) {
                let windows = window.windows.first
                windows?.overrideUserInterfaceStyle = self.isOn == true ? .dark : .light
                userDefaults.set(isOn, forKey: "switchState")
                print("A")
            } else if let window = UIApplication.shared.windows.first {
                if #available(iOS 13.0, *) {
                    window.overrideUserInterfaceStyle = self.isOn == true ? .dark : .light
                    userDefaults.set(isOn, forKey: "switchState")
                    print("B")
                } else {
                    window.overrideUserInterfaceStyle = .light
                    print("C")
                }
            }
        }

    }
    
    @objc
    func handledSwitch(_ sender: UISwitch) {
        UIView.animate(withDuration: 0.4) {
            self.isOn =  self.isOn == true ? false : true
            self.updateToggle()
        }
    }

}

