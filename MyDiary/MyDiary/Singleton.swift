//
//  Singleton.swift
//  MyDiary
//
//  Created by 전도균 on 2022/10/07.
//

import Foundation
import UIKit

class Singleton {
    static let shared = Singleton()
    
    
    var title: String
    var image = UIImageView()
    var text: String
    
    private init() {
        image = UIImageView(image: UIImage(named: "title"))
        title = ""
        text = ""
    }
    
    
}
