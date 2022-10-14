//
//  ButtonView.swift
//  PictureMyDiary
//
//  Created by 전도균 on 2022/10/11.
//

import UIKit

protocol ButtonViewDelegate: AnyObject {
    func didTapEditButton(tag: Int)
    func didTapDeleteButton(tag: Int)
}

class ButtonView: UIView {
    let editButton = UIButton(type: .system)
    let deleteButton = UIButton(type: .system)
//    let lineDashPattern: [NSNumber] = [6, 12, 18, 24]
//
//    let path = CGMutablePath()
//    let shapeLayer = CAShapeLayer()
    
    
    weak var delegate: ButtonViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ButtonView {
    private func setUI() {
        [editButton, deleteButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        
        editButton.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        editButton.addTarget(self, action: #selector(didTapEditButton(_:)), for: .touchUpInside)
        
        deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton(_:)), for: .touchUpInside)
        
        // border dash line
//        shapeLayer.strokeColor = UIColor.lightGray.cgColor
//        shapeLayer.lineWidth = 2
//        shapeLayer.lineDashPattern = self.lineDashPattern
//        path.addLines(between: [CGPoint(x: 0, y: 230),
//                               CGPoint(x: 640, y: 230)])
//        shapeLayer.path = path
//        self.layer.addSublayer(shapeLayer)
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            editButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            editButton.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -10),
            editButton.widthAnchor.constraint(equalToConstant: 20),
            editButton.heightAnchor.constraint(equalToConstant: 20),
            
            deleteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

extension ButtonView {
    @objc
    private func didTapEditButton(_ sender: UIButton) {
        print(#function)
        delegate?.didTapEditButton(tag: tag)
    }

    @objc
    private func didTapDeleteButton(_ sender: UIButton) {
        print(#function)
        delegate?.didTapDeleteButton(tag: tag)
    }
}
