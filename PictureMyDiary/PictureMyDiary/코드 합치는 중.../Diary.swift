//
//  Diary.swift
//
//  Created by 정유진 on 2022/10/15.
//

import Foundation

class Diary {
    var content: String // 새로운 일기
    var insertDate: Date // 일기 저장 날짜
    
    init(content: String) {
        self.content = content
        insertDate = Date()
    }
    
    static var dummyDiaryList = [
        Diary(content: "새일기"),
        Diary(content: "날짜")
    ]
}
