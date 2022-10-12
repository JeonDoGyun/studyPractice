//
//  DashLineView.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/12.
//

import UIKit

class DashLineView: UIView {

    let lineDashPattern: [NSNumber] = [2, 2] // 점선의 패턴 결정
    let path = CGMutablePath()
    let shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DashLineView {
    private func setUI() {
        self.backgroundColor = .white
        
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.lineDashPattern = self.lineDashPattern
        
        path.addLines(between: [CGPoint(x: 0, y: 5),
                                CGPoint(x: 400, y: 5)])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
        
    }
}

