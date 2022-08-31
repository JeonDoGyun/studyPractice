//
//  DateExtension.swift
//  ShelfLife
//
//  Created by 전도균 on 2022/08/30.
//

import Foundation
import UIKit

extension String {
    func stringToDate(string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: string) else { fatalError() }
        return date
    }
}

