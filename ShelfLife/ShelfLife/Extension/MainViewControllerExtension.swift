//
//  MainViewControllerExtension.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/09/01.
//

import Foundation

extension MainViewController {
    func calculateExpiryDate(startDate: Date, expiryDate: Int) -> Int {
        let currentDate = Date()
        let periodOfDate = Int(currentDate.timeIntervalSince(startDate)) / 86400
        return expiryDate - periodOfDate
    }
}
