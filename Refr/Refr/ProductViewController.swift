//
//  ProductViewController.swift
//  Refr
//
//  Created by 전도균 on 2022/11/19.
//

import UIKit

protocol DismissProductViewControllerDelegate: AnyObject {
    func dismissProductViewController()
}

class ProductViewController: UIViewController {
    
    let imageV = UIImageView()
    let addButton = UIButton(type: .system)
    let titleLabel = UILabel()
    let titleTextField = UITextField()
    let dateLabel = UILabel()
    let datePicker = UIDatePicker()
    let expiryLabel = UILabel()
    let expiryTextField = UITextField()
    let pickerView = UIPickerView()
    let pickerToolBar = UIToolbar()
    
    let inputToolBar = UIToolbar()
    
    var days: [Int] = []
    var selectedDay = 1
        
    weak var delegate: DismissProductViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAttributes()
        setPickerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        expiryTextField.inputView = pickerView
        titleTextField.text = ""
        expiryTextField.text = ""
    }
}

extension ProductViewController {
    private func setUI() {
        view.backgroundColor = .white
        [imageV, addButton, titleLabel, titleTextField, dateLabel, datePicker, expiryLabel, expiryTextField].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        addButton.setTitle("추가", for: .normal)
        addButton.addTarget(self, action: #selector(didTapAddButton(_:)), for: .touchUpInside)
        
        titleLabel.text = "제품명"
        titleLabel.sizeToFit()
        
        dateLabel.text = "구매날짜"
        dateLabel.sizeToFit()
        
        expiryLabel.text = "유통기한"
        expiryLabel.sizeToFit()
        
        expiryTextField.tintColor = .clear
        expiryTextField.inputView = pickerView
        expiryTextField.inputAccessoryView = pickerToolBar
    }
    
    private func setAttributes() {
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 100),
            
            imageV.topAnchor.constraint(equalTo: view.topAnchor, constant: 100), 
            imageV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageV.widthAnchor.constraint(equalToConstant: 200),
            imageV.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: imageV.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.widthAnchor.constraint(equalToConstant: 60),
            titleTextField.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20),
            titleTextField.widthAnchor.constraint(equalToConstant: 200),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            dateLabel.widthAnchor.constraint(equalToConstant: 60),
            dateLabel.heightAnchor.constraint(equalToConstant: 40),
            datePicker.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            datePicker.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            datePicker.widthAnchor.constraint(equalToConstant: 200),
            datePicker.heightAnchor.constraint(equalToConstant: 40),
            
            expiryLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            expiryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            expiryLabel.widthAnchor.constraint(equalToConstant: 60),
            expiryTextField.topAnchor.constraint(equalTo: expiryLabel.topAnchor),
            expiryTextField.leadingAnchor.constraint(equalTo: expiryLabel.trailingAnchor, constant: 20),
            expiryTextField.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func setPickerView() {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let doneButton1 = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(didTapDoneButton1(_:)))
        let space1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let inputButton = UIBarButtonItem(title: "직접 입력", style: .done, target: self, action: #selector(didTapInputButton(_:)))
        let cancelButton1 = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(didTapCancelButton(_:)))
        
        let doneButton2 = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(didTapDoneButton2(_:)))
        let space2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton2 = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(didTapCancelButton(_:)))
        
        pickerToolBar.sizeToFit()
        pickerToolBar.setItems([inputButton, space1, cancelButton1, doneButton1], animated: true)
        pickerToolBar.isUserInteractionEnabled = true
        
        inputToolBar.sizeToFit()
        inputToolBar.setItems([cancelButton2, space2, doneButton2], animated: true)
        inputToolBar.isUserInteractionEnabled = true
        
        // setDays 1~31
        for _ in 1...3 {
            for i in 1...31 {
                days.append(i)
            }
        }
        
        
    }
}

// MARK: - Button objc
extension ProductViewController {
    @objc
    private func didTapAddButton(_ sender: UIButton) {
        let warnAlertController = UIAlertController(title: "제품명과 날짜를 입력해주세요.", message: "", preferredStyle: .alert)
        let backAction = UIAlertAction(title: "확인", style: .cancel)
        warnAlertController.addAction(backAction)
        
        let addAlertController = UIAlertController(title: "제품을 추가하시겠습니까?", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let confirmAction = UIAlertAction(title: "추가", style: .default, handler: { _ in
            self.delegate?.dismissProductViewController()
            Product.shared.productImage.append(self.imageV.image!)
            Product.shared.productName.append(self.titleTextField.text!)
            Product.shared.expiryDate.append(self.expiryTextField.text!)
            
            self.dismiss(animated: true)
        })
        addAlertController.addAction(cancelAction)
        addAlertController.addAction(confirmAction)
        
        guard let title = titleTextField.text, title.count > 0 else {
            present(warnAlertController, animated: true)
            return
        }
        present(addAlertController, animated: true)
        
    }
    
    @objc
    private func didTapDoneButton1(_ sender: UIBarButtonItem) {
        expiryTextField.text = "\(selectedDay)일"
        expiryTextField.resignFirstResponder()
    }
    
    @objc
    private func didTapDoneButton2(_ sender: UIBarButtonItem) {
        expiryTextField.text?.append("일")
        expiryTextField.resignFirstResponder()
    }
    
    @objc
    private func didTapCancelButton(_ sender: UIBarButtonItem) {
        expiryTextField.text = ""
        expiryTextField.resignFirstResponder()
    }
    
    @objc
    private func didTapInputButton(_ sender: UIBarButtonItem) {
        expiryTextField.resignFirstResponder()
        expiryTextField.inputView = nil
        expiryTextField.inputAccessoryView = inputToolBar
        expiryTextField.keyboardType = .numberPad
        expiryTextField.becomeFirstResponder()
    }
}

extension ProductViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return days.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(days[row])일"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDay = days[row]
        print(selectedDay)
    }
}

extension ProductViewController: UIPickerViewDelegate {
    
}
