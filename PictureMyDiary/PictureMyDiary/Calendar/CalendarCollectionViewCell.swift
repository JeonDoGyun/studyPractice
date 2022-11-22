//
//  CalenderCollectionViewCell.swift
//  PictureMyDiary
//
//  Created by Eunsu JEONG on 2022/10/08.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CalanderCollectionViewCell"
    private lazy var dayLabel = UILabel()
    private lazy var todayFeeling = UIButton()
    let viewBackgrounColor = UIColor(displayP3Red: 235/235, green: 235/235, blue: 226/235, alpha: 1)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLabel(isCurrentMonth: false)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel(isCurrentMonth: false)
    }
    
    func configureLabel(isCurrentMonth: Bool) {
        addSubview(dayLabel)
        dayLabel.font = .boldSystemFont(ofSize: 12)
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            dayLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        if isCurrentMonth == true {
            let labelView = UIView()
            labelView.backgroundColor = .systemGray
            labelView.layer.cornerRadius = 8.5
            addSubview(labelView)
            
            labelView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                labelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
                labelView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                labelView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -23),
                labelView.widthAnchor.constraint(equalToConstant: 22)
            ])
            
            labelView.addSubview(dayLabel)
            addSubview(dayLabel)
            dayLabel.font = .boldSystemFont(ofSize: 12)
            dayLabel.textColor = .white
            dayLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                dayLabel.topAnchor.constraint(equalTo: labelView.topAnchor),
                dayLabel.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
                dayLabel.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
                dayLabel.heightAnchor.constraint(equalToConstant: 14)
            ])
        } else {
            let labelView = UIView()
            labelView.backgroundColor = viewBackgrounColor
            labelView.layer.cornerRadius = 8.5
            addSubview(labelView)
            
            labelView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                labelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
                labelView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                labelView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -23),
                labelView.widthAnchor.constraint(equalToConstant: 22)
            ])
            
            labelView.addSubview(dayLabel)
            addSubview(dayLabel)
            dayLabel.font = .boldSystemFont(ofSize: 12)
            dayLabel.textColor = .black
            dayLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                dayLabel.topAnchor.constraint(equalTo: labelView.topAnchor),
                dayLabel.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
                dayLabel.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
                dayLabel.heightAnchor.constraint(equalToConstant: 14)
            ])
        }
    }
    
    func update(day: String) {
        dayLabel.text = day
    }
    
    func configureTodayFeeling(isDiaryWritten: Bool, feeling: String) {
        if dayLabel.text == "" {
            todayFeeling.isHidden = true
            return
        } else if isDiaryWritten == false {
            todayFeeling.isHidden = true
            return
        } else {
            todayFeeling.isHidden = false
            addSubview(todayFeeling)
//            let imageConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
            let todayFeelingFaceImage = UIImage(named: feeling)
            todayFeeling.setImage(todayFeelingFaceImage, for: .normal)
            todayFeeling.tintColor = .label
            todayFeeling.addTarget(self, action: #selector(didTapFeelingButton(_ :)), for: .touchUpInside)
            todayFeeling.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                todayFeeling.centerXAnchor.constraint(equalTo: dayLabel.centerXAnchor),
                todayFeeling.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 12),
                todayFeeling.widthAnchor.constraint(equalToConstant: 50),
                todayFeeling.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    @objc private func didTapFeelingButton(_ sender: UIButton) {
        print(#function)
    }
}
