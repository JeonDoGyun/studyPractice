//
//  MemoViewController.swift
//  trip
//
//  Created by 전도균 on 2023/02/01.
//

import UIKit

class MemoViewController: UIViewController {
    
    let placeNameTextField = UITextField()
    
    let dateLabel = UILabel()
    
    let isMarkedLabel = UILabel()
    let markSwitch = UISwitch()
    
    let descriptionLabel = UILabel()
    
    let photoImageButton = UIButton(type: .system)
    
    let descriptionTextView = UITextView(usingTextLayoutManager: true)
    let textViewPlaceholder = "여기서 생긴 추억을 기록해주세요."

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        createUnderLine()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setUI() {
        [placeNameTextField, isMarkedLabel, markSwitch, dateLabel, photoImageButton, descriptionLabel, descriptionTextView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        placeNameTextField.placeholder = "이곳은 어디인가요?(장소 입력)"
        placeNameTextField.sizeToFit()
        
        isMarkedLabel.text = "지도에 표시"
        isMarkedLabel.sizeToFit()
        markSwitch.sizeToFit()
        markSwitch.onTintColor = .black
        markSwitch.addTarget(self, action: #selector(didTappedSwitch(_:)), for: .valueChanged)
        
        descriptionLabel.text = "사진과 그 안에서의 추억을 남겨주세요.(선택)"
        descriptionLabel.textColor = .lightGray
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.sizeToFit()
        
        photoImageButton.setTitle("+\n사진 추가", for: .normal)
        photoImageButton.addTarget(self, action: #selector(didTappedImageButton(_:)), for: .touchUpInside)
        photoImageButton.titleLabel?.font = .systemFont(ofSize: 15)
        photoImageButton.titleLabel?.lineBreakMode = .byWordWrapping
        photoImageButton.titleLabel?.textAlignment = .center
        photoImageButton.setTitleColor(.lightGray, for: .normal)
        photoImageButton.layer.borderColor = UIColor.lightGray.cgColor
        photoImageButton.layer.borderWidth = 1
        photoImageButton.layer.cornerRadius = 10
        
        descriptionTextView.layer.borderColor = UIColor.lightGray.cgColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 11, left: 12, bottom: 10, right: 12)
        descriptionTextView.text = textViewPlaceholder
        descriptionTextView.textColor = .lightGray
        descriptionTextView.delegate = self
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            placeNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            placeNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            isMarkedLabel.topAnchor.constraint(equalTo: placeNameTextField.bottomAnchor, constant: 30),
            isMarkedLabel.leadingAnchor.constraint(equalTo: placeNameTextField.leadingAnchor),
            markSwitch.centerYAnchor.constraint(equalTo: isMarkedLabel.centerYAnchor),
            markSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            descriptionLabel.topAnchor.constraint(equalTo: isMarkedLabel.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: placeNameTextField.leadingAnchor),
            
            photoImageButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            photoImageButton.leadingAnchor.constraint(equalTo: placeNameTextField.leadingAnchor),
            photoImageButton.widthAnchor.constraint(equalToConstant: 120),
            photoImageButton.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionTextView.centerYAnchor.constraint(equalTo: photoImageButton.centerYAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: photoImageButton.trailingAnchor, constant: 10),
            descriptionTextView.trailingAnchor.constraint(equalTo: markSwitch.trailingAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    private func createUnderLine() {
        placeNameTextField.borderStyle = .none
        let placeNameTextFieldBorder = CALayer()
        placeNameTextFieldBorder.frame = CGRect(x: 0, y: placeNameTextField.frame.size.height+5, width: placeNameTextField.frame.size.width, height: 1)
        placeNameTextFieldBorder.backgroundColor = UIColor.lightGray.cgColor
        placeNameTextField.layer.addSublayer(placeNameTextFieldBorder)
        
//        let descriptionLabelBorder = CALayer()
//        descriptionLabelBorder.frame = CGRect(x: 0, y: descriptionLabel.frame.size.height+5, width: descriptionLabel.frame.size.width, height: 1)
//        descriptionLabelBorder.backgroundColor = UIColor.lightGray.cgColor
//        descriptionLabel.layer.addSublayer(descriptionLabelBorder)
    }

}

extension MemoViewController {
    @objc
    private func didTappedSwitch(_ sender: UISwitch) {
        if sender.isOn {
            print("isOn")
        } else {
            print("isOff")
        }
    }
    
    @objc
    private func didTappedImageButton(_ sender: UIButton) {
        let addPhotoVC = AddPhotoViewController()
        addPhotoVC.modalPresentationStyle = .fullScreen
        present(addPhotoVC, animated: true)
    }
}

extension MemoViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceholder {
            descriptionTextView.text = nil
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            descriptionTextView.text = textViewPlaceholder
        }
    }
}
