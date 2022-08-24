//
//  ViewController.swift
//  Animation-Ex
//
//  Created by 전도균 on 2022/08/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let redView = UIView()
    let button = UIButton(type: .system)
    
    var redViewUpperAnchor: NSLayoutConstraint?
    var redViewLowerAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension ViewController {
    @objc
    func didTapButton(_ sender: UIButton) {
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: [.repeat, .autoreverse],
                       animations: {
            
            self.redView.snp.updateConstraints{
                $0.top.equalToSuperview().inset(600)
            }
            
            self.redView.alpha = 1
            self.redViewLowerAnchor?.priority = .required
            self.view.layoutIfNeeded() // 항상 설정 다 해주고 사용
        },
                       completion: nil)
        
        
    }
}

extension ViewController {
    private func setUI() {
        redView.backgroundColor = .red
        redView.alpha = 0
        button.setTitle("Animate", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(redView)
        view.addSubview(button)
        redView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Priority 0-1000
        // UILayoutPriority(751)
//        redViewUpperAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
//        redViewUpperAnchor?.priority = .required // 1000
//        redViewUpperAnchor?.priority = .defaultHigh // 750 .defaultLow // 250
//        redViewUpperAnchor?.priority = .defaultHigh // 250
        
        redViewLowerAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 600)
        redViewLowerAnchor?.priority = .defaultLow
        
        redViewUpperAnchor?.isActive = true
        redViewLowerAnchor?.isActive = true
        
        redView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(80)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(60)
        }
        
        button.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(80)
            
        }
        
        NSLayoutConstraint.activate([
//            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            redView.widthAnchor.constraint(equalToConstant: 60),
//            redView.heightAnchor.constraint(equalToConstant: 60),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
        
    }
}
