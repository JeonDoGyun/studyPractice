//
//  MemoViewController.swift
//  trip
//
//  Created by 전도균 on 2023/02/01.
//

import UIKit
//import FSCalendar calendar 관련 라이브러리
import CoreLocation

class MemoViewController: UIViewController {
    
    let placeNameTextField = UITextField()
    
    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    var memoDate = ""
    
    let isMarkedLabel = UILabel()
    var isMarked = Bool()
    let markSwitch = UISwitch()
    
    let descriptionLabel = UILabel()
    
    let photoImageView = UIImageView()
    let photoImageLabel = UILabel()
    
    let descriptionTextView = UITextView(usingTextLayoutManager: true)
    let textViewPlaceholder = "여기서 생긴 추억을 기록해주세요."
    
    let writeButton = UIButton(type: .system)
    
    var currentLocation = CLLocation()

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
        [placeNameTextField, datePicker, isMarkedLabel, markSwitch, photoImageView, descriptionLabel, descriptionTextView, writeButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        placeNameTextField.placeholder = "이곳은 어디인가요?(장소 입력)"
        placeNameTextField.sizeToFit()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(didhandledDatePicker(_:)), for: .valueChanged)
        
        isMarkedLabel.text = "지도에 표시"
        isMarkedLabel.sizeToFit()
        markSwitch.sizeToFit()
        markSwitch.onTintColor = .black
        markSwitch.addTarget(self, action: #selector(didTappedSwitch(_:)), for: .valueChanged)
        
        descriptionLabel.text = "사진과 그 안에서의 추억을 남겨주세요.(선택)"
        descriptionLabel.textColor = .lightGray
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.sizeToFit()
        
        photoImageView.layer.borderColor = UIColor.lightGray.cgColor
        photoImageView.layer.borderWidth = 1
        photoImageView.layer.cornerRadius = 10
        photoImageView.addSubview(photoImageLabel)
        photoImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedImageView)))
        photoImageView.isUserInteractionEnabled = true
        
        photoImageLabel.text = "+\n사진추가"
        photoImageLabel.lineBreakMode = .byWordWrapping
        photoImageLabel.numberOfLines = 0
        photoImageLabel.font = .systemFont(ofSize: 15)
        photoImageLabel.textColor = .lightGray
        photoImageLabel.textAlignment = .center
        photoImageLabel.sizeToFit()
        photoImageLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            photoImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            photoImageView.leadingAnchor.constraint(equalTo: placeNameTextField.leadingAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 120),
            photoImageView.heightAnchor.constraint(equalToConstant: 200),
            
            photoImageLabel.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor),
            photoImageLabel.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor),
            
            descriptionTextView.centerYAnchor.constraint(equalTo: photoImageView.centerYAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10),
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
        memoDate = convertDateToString(date: sender.date)
        print(sender.date)
        print(memoDate)
        dismiss(animated: false)
    }
    
    private func convertDateToString(date: Date) -> String {
        dateFormatter.dateFormat = "MM월 dd일 EEEE"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: date)
    }
    
    
    @objc
    private func didTappedSwitch(_ sender: UISwitch) {
        isMarked = sender.isOn ? true : false
        print(isMarked)
    }
    
    @objc
    private func didTappedImageView() {
        let actionsheet = UIAlertController(title: "", message: "Select Type", preferredStyle: .actionSheet)
        actionsheet.addAction(UIAlertAction(title: "기본 이미지 선택", style: .default, handler: { [weak self] _ in
            self?.basic()
        }))
        actionsheet.addAction(UIAlertAction(title: "카메라로 찍기", style: .default, handler: { [weak self] _ in
            self?.camera()
        }))
        actionsheet.addAction(UIAlertAction(title: "앨범에서 가져오기", style: .default, handler: { [weak self] _ in
            self?.photo()
        }))
        actionsheet.addAction(UIAlertAction(title: "확인", style: .cancel))
        present(actionsheet, animated: true)
    }
    
    private func basic() {
        photoImageView.backgroundColor = .white
        photoImageLabel.text = ""
    }
    
    private func photo() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    private func camera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    @objc
    private func didTappedWriteButton(_ sender: UIButton) {
        print("press button")
        let placeVM = PlaceViewModel()
        if let text = placeNameTextField.text, let memo = descriptionTextView.text {
            placeVM.sendPlaceInfo(title: text, image: photoImageView.image ?? UIImage(), memo: memo, date: memoDate, isMarked: self.isMarked, location: self.currentLocation)
        }
        placeVM.updateNewData()
//        placeVM.removeAll() // 함수 다시 손봐야 됨 <- 이전에 넣었던거 아직 살아있음(배열에는 없지만 CoreData에 nil로 공간 차지 중)
        
        dismiss(animated: true) {
            // annotationView 표시
            if self.isMarked {
                // annotation 표시
            }
        }
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

extension MemoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("이미지 선택")
        picker.dismiss(animated: false) { () in
            let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.photoImageView.image = image
            self.photoImageLabel.text = ""
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("이미지 선택을 취소하였습니다.")
        self.dismiss(animated: false) { () in
            let alert = UIAlertController(title: "", message: "선택이 취소되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(alert, animated: true)
        }
    }
}

