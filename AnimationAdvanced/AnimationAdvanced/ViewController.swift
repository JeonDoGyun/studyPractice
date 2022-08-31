//
//  ViewController.swift
//  AnimationAdvanced
//
//  Created by 전도균 on 2022/08/29.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()
    let button = UIButton(type: .system)
    var topAnchor: NSLayoutConstraint?
    var leadingAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension ViewController {
    @objc
    func didTapButton(_ sender: UIButton) {
        animateKeyframes()
    }
}

extension ViewController {
    private func animateKeyframes() {
        
        UIView.animateKeyframes(withDuration: 4,
                                delay: 0,
                                animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, // 0~1까지의 값만 존재, % 개념
                               relativeDuration: 0.2, // 0~1까지의 값만 존재
                               animations: {
                self.leadingAnchor?.constant = self.view.frame.width - 80
                self.view.layoutIfNeeded()
            })
            UIView.addKeyframe(withRelativeStartTime: 0.2,
                               relativeDuration: 0.3,
                               animations: {
                self.topAnchor?.constant = self.view.frame.height - 140
                self.view.layoutIfNeeded()
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0.2,
                               animations: {
                self.leadingAnchor?.constant = 20
                self.view.layoutIfNeeded()
            })
            UIView.addKeyframe(withRelativeStartTime: 0.7,
                               relativeDuration: 0.3,
                               animations: {
                self.topAnchor?.constant = 80
                self.view.layoutIfNeeded()
            })
        })
    }
    
    private func animate() {
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [],
                       animations: {
            self.leadingAnchor?.constant = self.view.frame.width - 80
            self.view.layoutIfNeeded()
        },
                       completion: { _ in
            UIView.animate(withDuration: 1,
                           delay: 0,
                           options: [],
                           animations: {
                self.topAnchor?.constant = self.view.frame.height - 140
                self.view.layoutIfNeeded()
            },
                           completion: { _ in
                UIView.animate(withDuration: 1,
                               delay: 0,
                               options: [],
                               animations: {
                    self.leadingAnchor?.constant = 20
                    self.view.layoutIfNeeded()
                },
                               completion: { _ in
                    UIView.animate(withDuration: 1,
                                   delay: 0,
                                   options: [],
                                   animations: {
                        self.topAnchor?.constant = 80
                        self.view.layoutIfNeeded()
                    },
                                   completion: nil)
                    
                })
                
            }
            )
            
        }
        )
        
    }
    
    private func setUI() {
        redView.backgroundColor = .red
        
        button.setTitle("animate", for: .normal)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        [redView, button].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        topAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        topAnchor?.isActive = true
        leadingAnchor = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        leadingAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            redView.widthAnchor.constraint(equalToConstant: 60),
            redView.heightAnchor.constraint(equalToConstant: 60),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
    }
}
