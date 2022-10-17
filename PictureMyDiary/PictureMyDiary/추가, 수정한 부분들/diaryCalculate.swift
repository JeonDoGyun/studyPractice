//
//  diaryCalculate.swift
//  PictureMyDiary
//
//  Created by 전도균 on 2022/10/10.
//

import Foundation

extension WriteViewController {
    func calculateExpiryDate(startDate: Date) -> Int {
        let currentDate = Date()
        let periodOfDate = Int(currentDate.timeIntervalSince(startDate)) // 1일 표시 - (day) / 86400 1분 표시 - (hour) / 60
        return periodOfDate
    }
}
