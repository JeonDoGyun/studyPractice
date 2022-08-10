//
//  ViewController.swift
//  Autolayout_practice
//
//  Created by 전도균 on 2022/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    // 필수 설정 항목 - axis(가로, 세로) alignment(x, y축) distribution(x축 정렬) spacing(간격)
    
    let redView = UIView()
    let blueView = UIView()
    
    /* 이런 식으로 사용하면 속성들을 한 곳에 모을 수 있음
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(blueView)
        
//        view.addSubview(redView) // 항상 autolayout보다 앞에 있어야 됨
//        view.addSubview(blueView)
        
        stackView.axis = .vertical // vertical: 세로, horizonal : 가로
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 50
        stackView.backgroundColor = .gray
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 400),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            
            redView.widthAnchor.constraint(equalToConstant: 100),
//            redView.heightAnchor.constraint(equalToConstant: 100),
            
            blueView.widthAnchor.constraint(equalToConstant: 100),
//            blueView.heightAnchor.constraint(equalToConstant: 100),
            
        ])
        
        
        
        
//        // someView의 상단이 view의 상단에 붙어라
//        someView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        someView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
//        // trailing은 40하면 오른쪽으로 더 가는거니까 -40 해줘야 왼쪽으로 감
//        someView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
//        someView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
    }
    
}

// leadingAnchor vs leftAnchor : leading은 문화권이 바뀌면 글자에 따라 방향이 바뀜
// command 누른 상태에서 변수 클릭 : 영역 내 변수의 이름 한번에 바꿀 수 있음

/*
NSLayoutConstraint.activate([
    // redView
    redView.heightAnchor.constraint(equalToConstant: 120),
    redView.widthAnchor.constraint(equalToConstant: 120),
    redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    
    // blueView
    blueView.heightAnchor.constraint(equalToConstant: 120),
    blueView.widthAnchor.constraint(equalToConstant: 120),
    blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 50),
    blueView.centerXAnchor.constraint(equalTo: redView.centerXAnchor)
])
*/
