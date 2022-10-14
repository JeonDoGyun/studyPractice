//
//  NewDiaryViewController.swift
//  PictureMyDiary
//
//  Created by Eunsu JEONG on 2022/10/08.
//

import UIKit
//import SwiftUI
//
//class NewDiaryViewController: UIViewController {
//
//    var tag = 1
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUI()
//    }
//}
//
//extension NewDiaryViewController {
//    private func setUI() {
//        let hostView = UIHostingController(rootView: contentView)
//        self.present(hostView, animated: false, completion: nil)
//    }
//}

// 수정 전

class NewDiaryViewController: UIViewController {

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

extension NewDiaryViewController {
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

            picture.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            picture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picture.widthAnchor.constraint(equalToConstant: 300),
            picture.bottomAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: -20),

            descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: popButton.topAnchor, constant: -10),
            descriptionTextView.widthAnchor.constraint(equalToConstant: 300),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 300),

            popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            popButton.widthAnchor.constraint(equalToConstant: 100),

        ])
    }
}

extension NewDiaryViewController {
    @objc
    private func didTapPopButton(_ sender: UIButton) {

        // 수정한 시간 표시
        let dateLast = calculateExpiryDate(startDate: Singleton.shared.writeDate[tag])
        if dateLast < 60 {
            Singleton.shared.dateLast[tag] = "\(dateLast)초 전 수정됨"
        } else if dateLast < 86400 {
            Singleton.shared.dateLast[tag] = "\(dateLast/60)분 전 수정됨"
        } else {
            Singleton.shared.dateLast[tag] = "\(dateLast/86400)일 전 수정됨"
        }

        Singleton.shared.description[tag] = descriptionTextView.text
        self.navigationController?.popViewController(animated: true)
        print(dateLast)
        print(#function)
    }

    @objc
    private func handleDatePicker(_ sender: UIDatePicker) {
        Singleton.shared.writeDate[tag] = sender.date
        print(sender.date.dateToString())
    }
}
