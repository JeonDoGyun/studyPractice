//
//  SharedData.swift
//  Domino
//
//  Created by 전도균 on 2022/09/21.
//

import Foundation

class SharedData {
    static let shared = SharedData()
    private init () {}
    
    // 공유할 데이터 목록
    var count = 0 // 버튼 카운트
}
