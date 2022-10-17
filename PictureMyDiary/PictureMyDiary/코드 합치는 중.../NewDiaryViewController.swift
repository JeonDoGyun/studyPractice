//
//  NewDiaryViewController.swift
//  PictureMyDiary
//
//  Created by Eunsu JEONG on 2022/10/08.
//

import UIKit

class NewDiaryViewController: UIViewController {
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        
        //앞 기분 선택 화면
        button1.setTitle("go", for: .normal)
        button1.setImage(UIImage.init(named: "face1"), for: .normal)
        view.addSubview(button1)
        button1.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        button1.setTitleColor(.black, for: .normal)
        button1.frame = CGRect(x: 80, y: 300, width: 50, height: 52)
        button1.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        button2.setTitle("go2", for: .normal)
        button2.setImage(UIImage.init(named: "face5"), for: .normal)
        view.addSubview(button2)
        button2.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        button2.setTitleColor(.black, for: .normal)
        button2.frame = CGRect(x: 170, y: 300, width: 50, height: 52)
        button2.addTarget(self, action: #selector(didTapButton2), for: .touchUpInside)
        
        button3.setTitle("go3", for: .normal)
        button3.setImage(UIImage.init(named: "face3"), for: .normal)
        view.addSubview(button3)
        button3.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        button3.setTitleColor(.black, for: .normal)
        button3.frame = CGRect(x: 260, y: 300, width: 50, height: 52)
        button3.addTarget(self, action: #selector(didTapButton3), for: .touchUpInside)
        
        button4.setTitle("go4", for: .normal)
        button4.setImage(UIImage.init(named: "face4"), for: .normal)
        view.addSubview(button4)
        button4.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        button4.setTitleColor(.black, for: .normal)
        button4.frame = CGRect(x: 125, y: 400, width: 50, height: 52)
        button4.addTarget(self, action: #selector(didTapButton4), for: .touchUpInside)
        
        button5.setTitle("go5", for: .normal)
        button5.setImage(UIImage.init(named: "face2"), for: .normal)
        view.addSubview(button5)
        button5.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
        button5.setTitleColor(.black, for: .normal)
        button5.frame = CGRect(x: 220, y: 400, width: 50, height: 52)
        button5.addTarget(self, action: #selector(didTapButton5), for: .touchUpInside)
       
    }
    
    @objc private func didTapButton() {
        let writeVC = NextViewController()
        let navVC = UINavigationController(rootViewController: writeVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc private func didTapButton2() {
        let writeVC2 = NextViewController2()
        let navVC2 = UINavigationController(rootViewController: writeVC2)
        navVC2.modalPresentationStyle = .fullScreen
        present(navVC2, animated: true)
    }
    
    @objc private func didTapButton3() {
        let writeVC3 = NextViewController3()
        let navVC3 = UINavigationController(rootViewController: writeVC3)
        navVC3.modalPresentationStyle = .fullScreen
        present(navVC3, animated: true)
    }
    
    @objc private func didTapButton4() {
        let writeVC4 = NextViewController4()
        let navVC4 = UINavigationController(rootViewController: writeVC4)
        navVC4.modalPresentationStyle = .fullScreen
        present(navVC4, animated: true)
    }
    
    @objc private func didTapButton5() {
        let writeVC5 = NextViewController5()
        let navVC5 = UINavigationController(rootViewController: writeVC5)
        navVC5.modalPresentationStyle = .fullScreen
        present(navVC5, animated: true)
        
    }
    
}



// 수정 전
//class NewDiaryViewController: UIViewController {
//
//    let datePicker = UIDatePicker()
//    let picture = UIImageView()
//    let descriptionTextView = UITextView()
//    let popButton = UIButton(type: .system)
//
//    var tag = 1
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUI()
//        setLayout()
//    }
//
//}
//
//extension NewDiaryViewController {
//    private func setUI() {
//        view.backgroundColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
//        [datePicker, picture, descriptionTextView, popButton].forEach {
//            view.addSubview($0)
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
//
//        datePicker.preferredDatePickerStyle = .automatic
//        datePicker.locale = Locale(identifier: "ko-KR")
//        datePicker.datePickerMode = .dateAndTime
//        datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
//
//        picture.backgroundColor = .red
//
//        descriptionTextView.layer.borderColor = UIColor.gray.cgColor
//        descriptionTextView.layer.borderWidth = 0.5
//        descriptionTextView.layer.cornerRadius = 4
//        descriptionTextView.textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
//        descriptionTextView.scrollIndicatorInsets = .init(top: 0, left: 0, bottom: 0, right: 5)
//        descriptionTextView.text = Singleton.shared.description[tag]
//
//        popButton.setTitle("되돌아가기", for: .normal)
//        popButton.addTarget(self, action: #selector(didTapPopButton(_:)), for: .touchUpInside)
//    }
//
//    private func setLayout() {
//        NSLayoutConstraint.activate([
//            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            picture.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
//            picture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            picture.widthAnchor.constraint(equalToConstant: 300),
//            picture.bottomAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: -20),
//
//            descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            descriptionTextView.bottomAnchor.constraint(equalTo: popButton.topAnchor, constant: -10),
//            descriptionTextView.widthAnchor.constraint(equalToConstant: 300),
//            descriptionTextView.heightAnchor.constraint(equalToConstant: 300),
//
//            popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            popButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
//            popButton.widthAnchor.constraint(equalToConstant: 100),
//
//        ])
//    }
//}
//
//extension NewDiaryViewController {
//    @objc
//    private func didTapPopButton(_ sender: UIButton) {
//
//        // 수정한 시간 표시
//        let dateLast = calculateExpiryDate(startDate: Singleton.shared.writeDate[tag])
//        if dateLast < 60 {
//            Singleton.shared.dateLast[tag] = "\(dateLast)초 전 수정됨"
//        } else if dateLast < 86400 {
//            Singleton.shared.dateLast[tag] = "\(dateLast/60)분 전 수정됨"
//        } else {
//            Singleton.shared.dateLast[tag] = "\(dateLast/86400)일 전 수정됨"
//        }
//
//        Singleton.shared.description[tag] = descriptionTextView.text
//        self.navigationController?.popViewController(animated: true)
//        print(dateLast)
//        print(#function)
//    }
//
//    @objc
//    private func handleDatePicker(_ sender: UIDatePicker) {
//        Singleton.shared.writeDate[tag] = sender.date
//        print(sender.date.dateToString())
//    }
//}
