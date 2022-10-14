//
//  ViewController.swift
//  PictureMyDiary
//
//  Created by Eunsu JEONG on 2022/10/08.
//

import UIKit

class CalendarViewController: UIViewController {
    
    // 배경색
    let viewBackgrounColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
    
    // calendar view 구성을 위한 property
    private lazy var scrollView = UIScrollView()
    private lazy var contentView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var previousButton = UIButton()
    private lazy var nextButton = UIButton()
    private lazy var todayButton = UIButton()
    private lazy var alarmButton = UIButton()
    private lazy var weekStackView = UIStackView()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    // calendar date set을 위한 property
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    private var calendarDate = Date()
    private var todaysDate = Date()
    private var days = [String]()
    
    // alert datePicker popup
    lazy private var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.timeZone = NSTimeZone.local
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.tintColor = .black
        tabBarController?.tabBar.unselectedItemTintColor = .gray
        view.backgroundColor = viewBackgrounColor
        navigationController?.isNavigationBarHidden = true
        configure()
    }
    
    private func configure() {
        configureScrollView()
        configureContentView()
        configureTitleLabel()
        configurePreviousButton()
        configureNextButton()
        configureTodayButton()
        configureAlarmButton()
        configureWeekStackView()
        configureWeekLabel()
        configureCollectionView()
        configureCalendar()
    }
    
    // Set View Size and Location
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureContentView() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    // Set Title
    private func configureTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.text = "2000년 01월"
        titleLabel.font = .monospacedDigitSystemFont(ofSize: 18, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    // Set Buttons
    private func configurePreviousButton() {
        contentView.addSubview(previousButton)
        previousButton.tintColor = .label
        previousButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        previousButton.addTarget(self, action: #selector(didTapPreviousButton(_:)), for: .touchUpInside)
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previousButton.widthAnchor.constraint(equalToConstant: 44),
            previousButton.heightAnchor.constraint(equalToConstant: 44),
            previousButton.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -5),
            previousButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    private func configureNextButton() {
        contentView.addSubview(nextButton)
        nextButton.tintColor = .label
        nextButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        nextButton.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 44),
            nextButton.heightAnchor.constraint(equalToConstant: 44),
            nextButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
            nextButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    private func configureTodayButton() {
        contentView.addSubview(todayButton)
        todayButton.setTitle("Today", for: .normal)
        todayButton.titleLabel?.font = .monospacedDigitSystemFont(ofSize: 13, weight: .medium)
        todayButton.setTitleColor(.systemBackground, for: .normal)
        todayButton.backgroundColor = .label
        todayButton.layer.cornerRadius = 5
        todayButton.addTarget(self, action: #selector(didTapTodayButton(_:)), for: .touchUpInside)
        todayButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayButton.widthAnchor.constraint(equalToConstant: 50),
            todayButton.heightAnchor.constraint(equalToConstant: 25),
            todayButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            todayButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    private func configureAlarmButton() {
        contentView.addSubview(alarmButton)
        alarmButton.tintColor = .label
        alarmButton.setImage(UIImage(systemName: "alarm"), for: .normal)
        alarmButton.addTarget(self, action: #selector(didTapAlarmButton(_:)), for: .touchUpInside)
        alarmButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alarmButton.widthAnchor.constraint(equalToConstant: 44),
            alarmButton.heightAnchor.constraint(equalToConstant: 44),
            alarmButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            alarmButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ])
    }
    
    // Set Weekday
    private func configureWeekStackView() {
        contentView.addSubview(weekStackView)
        weekStackView.distribution = .fillEqually
        weekStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weekStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            weekStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            weekStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5)
        ])
    }
    
    private func configureWeekLabel() {
        let dayOfTheWeek = ["일", "월", "화", "수", "목", "금", "토"]
        
        for i in 0..<7 {
            let weekDayLabel = UILabel()
            weekDayLabel.text = dayOfTheWeek[i]
            weekDayLabel.textAlignment = .center
            weekStackView.addArrangedSubview(weekDayLabel)
            
            if i == 0 {
                weekDayLabel.textColor = .systemRed
            } else if i == 6 {
                weekDayLabel.textColor = .systemBlue
            }
        }
    }
    
    // Set Calender
    private func configureCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = viewBackgrounColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: weekStackView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: weekStackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: weekStackView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 1.5),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // 현재 날짜에서 연, 월만 뽑아냄
    private func today() {
        let components = calendar.dateComponents([.year, .month], from: Date())
        calendarDate = calendar.date(from: components) ?? Date()
        
//        let dateComponentOfToday = calendar.dateComponents([.day], from: Date())
        
        updateCalendar()
    }
    
    private func configureCalendar() {
        dateFormatter.dateFormat = "yyyy월 MM월"
        today()
    }
    
    private func startDayOfTheWeek() -> Int {
        return calendar.component(.weekday, from: calendarDate) - 1
    }
    
    private func endDate() -> Int {
        return calendar.range(of: .day, in: .month, for: calendarDate)?.count ?? Int()
    }
    
    private func updateTitle() {
        let date = dateFormatter.string(from: calendarDate)
        titleLabel.text = date
    }
    
    private func updateDays() {
        days.removeAll()
        let startDayOfTheWeek = startDayOfTheWeek()
        let totalDays = startDayOfTheWeek + endDate()
        
        for day in Int()..<totalDays {
            if day < startDayOfTheWeek {
                days.append("")
                continue
            }
            days.append("\(day - startDayOfTheWeek + 1)")
        }
        collectionView.reloadData()
    }
    
    private func updateCalendar() {
        updateTitle()
        updateDays()
    }
    
    private func minusMonth() {
        calendarDate = calendar.date(byAdding: DateComponents(month: -1), to: calendarDate) ?? Date()
        updateCalendar()
    }
    
    private func plusMonth() {
        calendarDate = calendar.date(byAdding: DateComponents(month: 1), to: calendarDate) ?? Date()
        updateCalendar()
    }
    
    @objc
    private func didTapPreviousButton(_ sender: UIButton) {
        minusMonth()
    }
    
    @objc
    private func didTapNextButton(_ sender: UIButton) {
        plusMonth()
    }
    
    @objc
    private func didTapTodayButton(_ sender: UIButton) {
        today()
    }
    
/** didTapAlarmButton
 - Note: CalanderView 상단의 알람 버튼을 누르면 actionSheet 형식의 UIAlert가 뜨고, Controller안에 datePicker가 나온다.
 
 - Parameters:
    - datePicker: datePicker():
    - alarmAlertController: UIAlertController(prefferedStyle: .actionSheet)
    - alarmSetConfirm: UIAlertAction(), 알람 설정 확인
    - dateFormatter: DateFormatter(), 오전/오후 시:분
    - selectedDate: String, 알람 설정 확인 버튼을 누르면 시간이 전달되어 저장됨
    - alarmSetCancel: UIAlertAction(), 알람 설정 취소
    - alertControllerHeight: NSLayoutConstraint(), actionSheet로 불러진 alertController 높이 설정
 
- Returns:
*/

    
    
    @objc
    private func didTapAlarmButton(_ sender: UIButton) {
        let alarmAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alarmAlertController.view.addSubview(datePicker)
        let alarmSetConfirm = UIAlertAction(title: "확인", style: .default) { [self] _ in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "a hh:mm"
            
            // Obtain the date according to the format.
            let selectedDate: String = dateFormatter.string(from: datePicker.date)
            print(selectedDate)
        }
        let alarmSetCancel = UIAlertAction(title: "취소", style: .cancel)

        alarmAlertController.addAction(alarmSetConfirm)
        alarmAlertController.addAction(alarmSetCancel)
        
        let alertControllerHeight = NSLayoutConstraint(
            item: alarmAlertController.view as Any,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.1, constant: 330)
        
        alarmAlertController.view.addConstraint(alertControllerHeight)
        
        present(alarmAlertController, animated: true)
        
    }
    @objc
    private func handleDatePicker(_ sender: UIDatePicker) {
        print(#function)
    }
    
}

extension CalendarViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // 생성할 셀의 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    // custom cell을 collectionView에 넣어줌
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
        cell.update(day: days[indexPath.item])
        
        let todaysDateFormatter = DateFormatter()
        todaysDateFormatter.dateFormat = "d"
        let todaysDate = todaysDateFormatter.string(from: Date())
        cell.configureLabel(today: todaysDate)
        
        cell.configureTodayFeeling()
        return cell
    }
    
    // 셀 크기과 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = weekStackView.frame.width / 7
        return CGSize(width: width, height: width * 1.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}


