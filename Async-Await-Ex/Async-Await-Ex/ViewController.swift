//
//  ViewController.swift
//  Async-Await-Ex
//
//  Created by 전도균 on 2022/09/19.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let result = NetworkService.shared.getQuote { result in
//            switch result {
//            case .success(let quote):
//                print("Escaping: \(quote)")
//            case .failure(let error):
//                print(error)
//
//            }
//        }
        Task { // await 사용하려면 Task 블록 안에 넣어야 됨
            print(await NetworkService.shared.continuationGetQuote())
            
//            let quote = await NetworkService.shared.getQuote()
//            print(quote)
//            print(await NetworkService.shared.getQuotes())
//            print(await NetworkService.shared.getQuotes1())
        }
    }
}
