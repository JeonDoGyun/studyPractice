//
//  Category.swift
//  Domino
//
//  Created by 전도균 on 2022/09/07.
//

import Foundation
import UIKit

enum Category: String, CaseIterable {
    case 슈퍼시드
    case 프리미엄
    case 클래식
    case 사이드디시
    case 음료
    case 피클소스
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
