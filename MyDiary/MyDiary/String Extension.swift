//
//  String Extension.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/09.
//

import Foundation

extension String {
    func stringToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFormatter.date(from: self) else { return nil}
        return date
    }
}
