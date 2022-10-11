//
//  EditViewController.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/09.
//

import UIKit

class EditViewController: UIViewController {
    
    let datePicker = UIDatePicker()
    let picture = UIImageView()
    let descriptionTextView = UITextView()
    let popButton = UIButton(type: .system)
    
    var tag = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }

}

extension EditViewController {
    private func setUI() {
        view.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        [datePicker, picture, descriptionTextView, popButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        
        picture.backgroundColor = .red
        
        descriptionTextView.layer.borderColor = UIColor.gray.cgColor
        descriptionTextView.layer.borderWidth = 0.5
        descriptionTextView.layer.cornerRadius = 4
        descriptionTextView.textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        descriptionTextView.scrollIndicatorInsets = .init(top: 0, left: 0, bottom: 0, right: 5)
        descriptionTextView.text = Singleton.shared.description[tag]
        
        popButton.setTitle("되돌아가기", for: .normal)
        popButton.addTarget(self, action: #selector(didTapPopButton(_:)), for: .touchUpInside)
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            picture.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            picture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picture.widthAnchor.constraint(equalToConstant: 300),
            picture.bottomAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: -20),
            
            descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: popButton.topAnchor, constant: -10),
            descriptionTextView.widthAnchor.constraint(equalToConstant: 300),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 300),
            
//            descriptionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            descriptionTextField.bottomAnchor.constraint(equalTo: dismissButton.topAnchor, constant: -10),
//            descriptionTextField.widthAnchor.constraint(equalToConstant: 300),
//            descriptionTextField.heightAnchor.constraint(equalToConstant: 300),
            
            popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            popButton.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}

extension EditViewController {
    @objc
    private func didTapPopButton(_ sender: UIButton) {
        let dateLast = calculateExpiryDate(startDate: Singleton.shared.writeDate[tag]) // 지난 날짜 초 단위
        
        Singleton.shared.description[tag] = descriptionTextView.text
        
        if dateLast < 60 {
            Singleton.shared.dateLast[tag] = "\(String(dateLast))초 전 수정됨"
        } else if dateLast < 86400 {
            Singleton.shared.dateLast[tag] = "\(String(dateLast/60))분 전 수정됨"
        } else {
            Singleton.shared.dateLast[tag] = "\(String(dateLast/86400))일 전 수정됨"
        }
        
        self.navigationController?.popViewController(animated: true)
        print(#function)
    }
    
    @objc
    private func handleDatePicker(_ sender: UIDatePicker) {
        Singleton.shared.writeDate[tag] = sender.date
        print(sender.date.dateToString())
    }
}
