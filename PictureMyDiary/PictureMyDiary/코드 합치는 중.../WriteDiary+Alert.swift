//
//  WriteDiary+Alert.swift
//  d
//
//  Created by 정유진 on 2022/10/15.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alert (title: String = "경고", message: String) {
           // alert view
           let alert = UIAlertController(title: title, message: "내용을 입력하세요",
                                         preferredStyle: .alert)
           // 경고창에 표시되는 버튼
           let okAction = UIAlertAction(title: "OK", style: .default,
                                        handler: nil )// 버튼 누르고 실행할 코드
           alert.addAction(okAction)
           // 경고창을 화면에 표시
           present(alert, animated: true, completion: nil)
           
       }

    
}

 
