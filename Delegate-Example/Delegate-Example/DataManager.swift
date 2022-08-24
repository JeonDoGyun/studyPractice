//
//  DataManager.swift
//  Delegate-Example
//
//  Created by 전도균 on 2022/08/24.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init() {} // 밖에서 빌드할 경우 init()이 나오게 되는데 빌드를 막기 위해 이렇게 작성, 협업 과정에서 singleton이 어디있는지 모를 수 있기 때문에
    
    var text = ""
    
}
