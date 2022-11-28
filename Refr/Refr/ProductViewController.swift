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
    
    var days: [Int] = []
    var selectedDay = 0
    
    weak var delegate: DismissProductViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAttributes()
        setPickerView()
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
        imageV.backgroundColor = .black
        
        titleLabel.text = "제품명"
        titleLabel.sizeToFit()
        titleTextField.backgroundColor = .blue
        
        dateLabel.text = "구매날짜"
        dateLabel.sizeToFit()
        
        expiryLabel.text = "유통기한"
        expiryLabel.sizeToFit()
        expiryTextField.backgroundColor = .green
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
        
        let doneButton = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(didTapDoneButton(_:)))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(didTapCancelButton(_:)))
        
        pickerToolBar.sizeToFit()
        pickerToolBar.setItems([cancelButton, space, doneButton], animated: true)
        pickerToolBar.isUserInteractionEnabled = true
        
        // setDays 1~31
        for i in 1...31 {
            days.append(i)
        }
    }
}

// MARK: - Button objc
extension ProductViewController {
    @objc
    private func didTapAddButton(_ sender: UIButton) {
        print(#function)
        let alertController = UIAlertController(title: "제품을 추가하시겠습니까?", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        let confirmAction = UIAlertAction(title: "추가", style: .default, handler: { _ in
            self.delegate?.dismissProductViewController()
            Product.shared.productImage.append(self.imageV.image!)
            Product.shared.productName.append(self.titleTextField.text!)
            Product.shared.expiryDate.append(self.selectedDay)
            
            self.dismiss(animated: true)
        })
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }
    
    @objc
    private func didTapDoneButton(_ sender: UIBarButtonItem) {
        expiryTextField.text = "\(selectedDay)일"
        expiryTextField.resignFirstResponder()
    }
    
    @objc
    private func didTapCancelButton(_ sender: UIBarButtonItem) {
        expiryTextField.resignFirstResponder()
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
