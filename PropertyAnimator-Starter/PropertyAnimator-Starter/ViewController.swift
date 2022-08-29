//
//  ViewController.swift
//  PropertyAnimator-Starter
//
//  Created by 전도균 on 2022/08/29.
//

import UIKit

class ViewController: UIViewController {
    
    enum Button: String, CaseIterable {
        case start
        case pause
        case stop
    }
    
    private let redView = UIView()
    private let stackView = UIStackView()
    
    private var animator: UIViewPropertyAnimator?
    
    private var topAnchor: NSLayoutConstraint?
    private var leadingAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}
extension ViewController {
    @objc
    func didTapButton(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case Button.start.rawValue:
            startAnimation()
        case Button.pause.rawValue:
            pauseAnimation()
        case Button.stop.rawValue:
            stopAnimation()
        default:
            fatalError()
        }
    }
}

extension ViewController {
    private func startAnimation() {
        if animator == nil {
            animator = UIViewPropertyAnimator(duration: 4, timingParameters: UICubicTimingParameters())
            animator?.addAnimations {
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
        }
        animator?.startAnimation()
    }
    
    private func pauseAnimation() {
        animator?.pauseAnimation()
    }
    
    private func stopAnimation() {
        animator?.stopAnimation(false)
        animator?.finishAnimation(at: .current)
        animator = nil
        topAnchor?.constant = 80
        leadingAnchor?.constant = 20
        view.setNeedsLayout()
    }
}

extension ViewController {
    private func setUI() {
        redView.backgroundColor = .red
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        [redView, stackView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        Button.allCases.forEach {
            let button = UIButton(type: .system)
            button.setTitle($0.rawValue, for: .normal)
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        
        topAnchor = redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80)
        topAnchor?.isActive = true
        leadingAnchor = redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        leadingAnchor?.isActive = true
        
        NSLayoutConstraint.activate([
            redView.widthAnchor.constraint(equalToConstant: 60),
            redView.heightAnchor.constraint(equalToConstant: 60),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            stackView.widthAnchor.constraint(equalToConstant: view.frame.width - 40)
        ])
    }
}

