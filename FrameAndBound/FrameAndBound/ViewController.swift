//
//  ViewController.swift
//  FrameAndBound
//
//  Created by 전도균 on 2022/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    // control 마우스로 연결
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        secondView.frame.origin = CGPoint(x: 50, y: 50) // frame의 기준은 항상 직계 부모에 있다고 생각하면 됨. bounds의 기준은 자기 자신
//        thirdView.frame.origin = CGPoint(x: 50, y: 50)
        
        secondView.bounds.origin = CGPoint(x: 50, y: 50) // 왼쪽 위 지점 (0, 0)을 (50, 50)으로 바꾸겠다는 의미 / 지도앱에서 끌어당기는거에 사용
//        thirdView.bounds.origin = CGPoint(x: 50, y: 50)
        
        
        
        
    }


}

// command option control enter : viewController Main 창 같이 띄우기
