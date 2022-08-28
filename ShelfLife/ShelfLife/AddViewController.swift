//
//  AddViewController.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/08/28.
//

import UIKit

class AddViewController: UIViewController {
    
    let discriptionLable = UILabel()
    
    let productTextField = UITextField()
    let expiryDateTextField = UITextField()
    let saveDateTextField = UITextField()
    
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    let saveButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUI()
    }
}

extension AddViewController {
    func setUI() {
        view.addSubview(discriptionLable)
        view.addSubview(productTextField)
        view.addSubview(expiryDateTextField)
        view.addSubview(saveDateTextField)
        view.addSubview(saveButton)
        
        discriptionLable.translatesAutoresizingMaskIntoConstraints = false
        productTextField.translatesAutoresizingMaskIntoConstraints = false
        expiryDateTextField.translatesAutoresizingMaskIntoConstraints = false
        saveDateTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        discriptionLable.text = "제품명, 유통기한, 저장날짜를 \n순서대로 입력하시오. "
        discriptionLable.numberOfLines = 0
        discriptionLable.font = .systemFont(ofSize: 25)
        discriptionLable.textAlignment = .center
        discriptionLable.sizeToFit()
        
        productTextField.placeholder = "제품명 (영어만 입력)"
        productTextField.layer.borderWidth = 1
        productTextField.layer.borderColor = UIColor.gray.cgColor
        
        expiryDateTextField.placeholder = "유통기한 (숫자만 입력)"
        expiryDateTextField.keyboardType = .numberPad

        
        saveDateTextField.placeholder = "저장날짜"
        saveDateTextField.layer.borderWidth = 1
        saveDateTextField.layer.borderColor = UIColor.gray.cgColor
        
        createDatepicker()
        
        saveButton.setTitle("저장", for: .normal)
        saveButton.addTarget(self, action: #selector(didTappedSaveButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            discriptionLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            discriptionLable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            discriptionLable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            discriptionLable.heightAnchor.constraint(equalToConstant: 100),
            
            productTextField.topAnchor.constraint(equalTo: discriptionLable.bottomAnchor),
            productTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productTextField.heightAnchor.constraint(equalToConstant: 60),
            
            expiryDateTextField.topAnchor.constraint(equalTo: productTextField.bottomAnchor),
            expiryDateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            expiryDateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            expiryDateTextField.heightAnchor.constraint(equalToConstant: 60),
            
            saveDateTextField.topAnchor.constraint(equalTo: expiryDateTextField.bottomAnchor),
            saveDateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            saveDateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            saveDateTextField.heightAnchor.constraint(equalToConstant: 60),
            
            saveButton.heightAnchor.constraint(equalToConstant: 140),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension AddViewController {
    @objc func didTappedSaveButton(_ sender : UIButton) {
        print(#function)
    }
}

extension AddViewController {
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: nil,
                                         action: #selector(didTappedDoneButton))
        toolbar.setItems([doneButton], animated: true)
        return toolbar
    }
    
    func createDatepicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        saveDateTextField.inputView = datePicker
        saveDateTextField.inputAccessoryView = createToolbar()
    }
    
    @objc func didTappedDoneButton() {
        saveDateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
}


//        let alertController = UIAlertController(title: "", message: "상품, 유통기한, 저장일을 순서대로 입력하시오.", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
//        let confirmAction = UIAlertAction(title: "등록", style: .default, handler: { _ in
//            self.titles.append(alertController.textFields?[0].text ?? "")
//
//        })
//
//        alertController.addTextField{ (productName) in
//            productName.placeholder = ""
//        }
//        alertController.addTextField{ (shelfLife) in
//            shelfLife.placeholder = "숫자만 입력"
//        }
//
//        alertController.addTextField{ (date) in
//            date.placeholder = "yyyy-MM-dd"
//            self.createDatepicker()
//            date.inputView = self.datePicker
//            date.inputAccessoryView = self.createToolbar()
//
//        }
//
//        alertController.addAction(cancelAction)
//        alertController.addAction(confirmAction)
//        present(alertController, animated: true)
