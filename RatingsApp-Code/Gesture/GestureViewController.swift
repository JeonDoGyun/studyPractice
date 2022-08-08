//
//  GestureViewController.swift
//  RatingsApp-Code
//
//  Created by 전도균 on 2022/08/01.
// command n / cocoa / create

import UIKit

class GestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftGesture = UISwipeGestureRecognizer(target: self, action: #selector(leftDidSwipe(_:)))
        leftGesture.direction = .left
        view.addGestureRecognizer(leftGesture)
        
        let rightGesture = UISwipeGestureRecognizer(target: self, action: #selector(rightDidSwipe(_:)))
        rightGesture.direction = .right // left가 default 값으로 주어짐
        view.addGestureRecognizer(rightGesture)
    }
    @objc
    func leftDidSwipe(_ sender: UISwipeGestureRecognizer){
//        var touchLocation = sender.location(in: view) // 터치한 location
//        print(touchLocation)
        let nextVC = LeftGestureViewController()
        present(nextVC, animated: true)
    }
    
    @objc
    func rightDidSwipe(_ sender: UISwipeGestureRecognizer){
        let nextVC = RightGestureViewController()
        present(nextVC, animated: true)
    }
}
