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
    
    var title: [String]
    var image = UIImageView()
    var description: [String]
    var writeDate: [Date]
    var dateLast: [String]
    
    private init() {
        image = UIImageView(image: UIImage(named: "title"))
        title = ["A", "B", "C"]
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
