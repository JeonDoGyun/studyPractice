//
//  MemoViewController.swift
//  trip
//
//  Created by 전도균 on 2023/02/01.
//

import UIKit
import FSCalendar // calendar 관련 라이브러리

class MemoViewController: UIViewController {
    
    let placeNameTextField = UITextField()
    
    let datePicker = UIDatePicker()
    let calendarView = FSCalendar()
    
    let isMarkedLabel = UILabel()
    let markSwitch = UISwitch()
    
    let descriptionLabel = UILabel()
    
    let photoImageButton = UIButton(type: .system)
    
    let descriptionTextView = UITextView(usingTextLayoutManager: true)
    let textViewPlaceholder = "여기서 생긴 추억을 기록해주세요."
    
    let writeButton = UIButton(type: .system)

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
        [placeNameTextField, datePicker, isMarkedLabel, markSwitch, calendarView, photoImageButton, descriptionLabel, descriptionTextView, writeButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        placeNameTextField.placeholder = "이곳은 어디인가요?(장소 입력)"
        placeNameTextField.sizeToFit()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.addTarget(self, action: #selector(didhandledDatePicker(_:)), for: .valueChanged)
//        datePicker.minimumDate = Date()
        
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
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 11, left: 12, bottom: 10, right: 12)
        descriptionTextView.text = textViewPlaceholder
        descriptionTextView.textColor = .lightGray
        descriptionTextView.delegate = self
        
        writeButton.backgroundColor = .lightGray
        writeButton.setTitleColor(.white, for: .normal)
        writeButton.setTitle("작성완료", for: .normal)
        writeButton.addTarget(self, action: #selector(didTappedWriteButton(_:)), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            placeNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            placeNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            datePicker.centerYAnchor.constraint(equalTo: placeNameTextField.centerYAnchor),
            datePicker.leadingAnchor.constraint(equalTo: placeNameTextField.trailingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: markSwitch.trailingAnchor),
            
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
            descriptionTextView.heightAnchor.constraint(equalToConstant: 200),
            
            writeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            writeButton.widthAnchor.constraint(equalToConstant: 200),
            writeButton.heightAnchor.constraint(equalToConstant: 40),
            writeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
            
        ])
    }
    
    private func createUnderLine() {
        placeNameTextField.borderStyle = .none
        let placeNameTextFieldBorder = CALayer()
        placeNameTextFieldBorder.frame = CGRect(x: 0, y: placeNameTextField.frame.size.height+5, width: placeNameTextField.frame.size.width, height: 1)
        placeNameTextFieldBorder.backgroundColor = UIColor.lightGray.cgColor
        placeNameTextField.layer.addSublayer(placeNameTextFieldBorder)
    }

}

extension MemoViewController {
    @objc
    private func didhandledDatePicker(_ sender: UIDatePicker) {
        print(sender.date)
        dismiss(animated: false)
    }
    
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
    
    @objc
    private func didTappedWriteButton(_ sender: UIButton) {
        print(#function)
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

//extension MemoViewController: UIDatePicker {
//
//}
