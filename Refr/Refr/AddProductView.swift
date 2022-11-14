//
//  AddProductView.swift
//  Refr
//
//  Created by 전도균 on 2022/11/14.
//

import UIKit

class AddProductView: UIStackView {
    
    let cameraButton = UIButton(type: .system)
    let photoButton = UIButton(type: .system)
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AddProductView {
    private func setUI() {
        backgroundColor = .systemBlue
        layer.cornerRadius = 20
        axis = .vertical
        alignment = .fill
        distribution = .fillEqually
        spacing = 5
    }
    
    private func setViews() {
        [cameraButton, photoButton].forEach {
            self.addArrangedSubview($0)
            $0.backgroundColor = .systemBlue
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 20
            $0.titleLabel?.font = .systemFont(ofSize: 17)
        }
        
        cameraButton.setTitle("카메라로 사진찍기", for: .normal)
        photoButton.setTitle("사진 가져오기", for: .normal)
        
    }
}
// MARK: - Button Objc
extension AddProductView {
    @objc
    private func didTapCameraButton(_ sender: UIButton) {
        print(#function)
    }
    
    @objc
    private func didTapPhotoButton(_ sender: UIButton) {
        print(#function)
    }
}
