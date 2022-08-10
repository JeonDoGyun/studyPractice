//
//  ViewController.swift
//  Component-Starter
//
//  Created by 전도균 on 2022/08/03.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()
    let button = UIButton(type: .system)
    let stepper = UIStepper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title = "Title"
        // navigationItem.title = "new title"
        // title 대신 image 달기
        let image = UIImage(systemName: "circle.grid.cross")
        let imageView = UIImageView(image: image)
        navigationItem.titleView = imageView
        
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(stepper)
        
        textField.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 30, width: 200, height: 40) // 중간으로 위치 잡는법 : (midX - width/2), (midY - height/2)
        textField.layer.borderColor = UIColor.gray.cgColor // 테두리 컬러
        textField.layer.borderWidth = 0.5 // 테두리 두께
        textField.layer.cornerRadius = 4 // 모서리 곡선 정도
        textField.delegate = self
        
        button.frame = CGRect(x: view.frame.midX,
                              y: view.frame.midY + 40,
                              width: 0,
                              height: 0)
        
        button.setTitle("Next", for: .normal)
        button.sizeToFit()
        let buttonWidth = button.frame.width
        button.frame.origin = CGPoint(x: view.frame.midX - buttonWidth / 2,
                                      y: view.frame.midY + 40)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        let stepperWidth = stepper.frame.width
        stepper.frame.origin = CGPoint(x: view.frame.midX - stepperWidth / 2,
                                       y: view.frame.midY - 100)
//        stepper.maximumValue = 5 // 최댓값 5로 설정
//        stepper.stepValue = 2 // 2씩 증가
        stepper.autorepeat = true // 계속 누르고 있었을 때 자동 증가하는 것
        
        // stepper 특징 - intrinsicContentSize : 자기 고유의 사이즈를 가짐
        stepper.addTarget(self, action: #selector(didTapStepper(_:)), for: .valueChanged)
        
    }
    
    @objc
    func didTapButton(_ sender: UIButton){
        let nextVC = SecondViewController()
        nextVC.label.text = textField.text ?? "No Data"
        present(nextVC, animated: true)
    }
    
    @objc
    func didTapStepper(_ sender: UIStepper) {
        print(sender.value) // Double 타입으로 나옴
        textField.text = String(sender.value)
    }
    
}

// Delegate Pattern
// textfield를 실시간으로 전달하는 방법
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text)
        return true
    }
}
