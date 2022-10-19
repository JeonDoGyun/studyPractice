//
//  Singleton.swift
//  PictureMyDiary
//
//  Created by 전도균 on 2022/10/10.
//

import Foundation
import UIKit

class Singleton {
    static let shared = Singleton()
    
    var feeling: [String]
    var insertDate: [Date] // 일기 쓴 날짜 언제인지?
    var title: [String]
    var image: [UIImage]
    var description: [String] 
    var writeDate: [Date]
    var dateLast: [String] // 얼마나 지났는가?
    
    
    private init() {
        feeling = ["", "", ""]
        insertDate = [Date(), Date(), Date()]
        title = ["A", "B", "C"]
        image = [UIImage(), UIImage(), UIImage()]
        description = ["""
abc
dsfasdfdsa
""",
"""
def
""",
"""
ghi
"""]
        writeDate = [Date(), Date(), Date()]
        dateLast = ["", "", ""]
    }
    
}
