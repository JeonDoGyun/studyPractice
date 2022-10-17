//
//  TimePickerViewController.swift
//  PictureMyDiary
//
//  Created by Eunsu JEONG on 2022/10/09.
//

import UIKit

class TimePickerViewController: UIViewController {
    
//    private let interval = 1.0
//    private var count = 0
//    private var pickerTimeLabel = UILabel()
//    private var currentTimeLabel = UILabel()
//    private var alarmTime: String?
//    private var currentTime: String?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        navigationController?.isNavigationBarHidden = false
//        view.backgroundColor = .systemBackground
//        Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(TimePickerViewController.updateTime), userInfo: nil, repeats: true)
//    }
//
//    private func configure() {
//        view.addSubview(pickerTimeLabel)
//        view.addSubview(currentTimeLabel)
//        pickerTimeLabel.translatesAutoresizingMaskIntoConstraints = false
//        currentTimeLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            pickerTimeLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
//            pickerTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            pickerTimeLabel.bottomAnchor.constraint(equalTo: pickerTimeLabel.topAnchor, constant: pickerTimeLabel.frame.height),
//
//        ])
//    }
//
//    private func changeDatePicker(_ sender: UIDatePicker) {
//        let datePickerView = sender
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "ko")
//        formatter.dateFormat = "a hh:mm"
//        pickerTimeLabel.text = "선택시간: \(formatter.string(from: datePickerView.date))"
//        alarmTime = formatter.string(from: datePickerView.date)
//    }
//
//    @objc
//    private func updateTime() {
//        count += 1
//
//        let date = NSDate()
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "ko")
//        formatter.dateFormat = "a hh:mm"
//        currentTimeLabel.text = "현재시간: \(formatter.string(from: date as Date))"
//        currentTime = formatter.string(from: date as Date)
//
//        if alarmTime == currentTime {
//            if count % 2 == 0 {
//                view.backgroundColor = .red
//            } else {
//                view.backgroundColor = .blue
//            }
//        } else {
//            view.backgroundColor = .systemBackground
//        }
//
//    }
    lazy var textField: UITextField = {
        // Create a UITextField.
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        textField.text = ""
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height - 100)
        return textField
    }()

    lazy var datePicker: UIDatePicker = {
        // Set datePicker (default is the position at the top of the screen).
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 200))
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.layer.cornerRadius = 5.0
        datePicker.layer.shadowOpacity = 0.5
        
        // Register the event when the value changed.
        datePicker.addTarget(self, action: #selector(onDidChangeDate(sender:)), for: .valueChanged)
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add UITextField on view
        self.view.addSubview(self.textField)
        
        // Add UIDatePicker
        self.view.addSubview(self.datePicker)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called when DatePicker is selected.
    @objc func onDidChangeDate(sender: UIDatePicker){
        // Generate the format.
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        
        // Obtain the date according to the format.
        let selectedDate: String = dateFormatter.string(from: sender.date)
        self.textField.text = selectedDate
    }
}


