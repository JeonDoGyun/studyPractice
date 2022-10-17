//
//  ViewController.swift
//  Combine-Ex
//
//  Created by 전도균 on 2022/10/17.
//

import Combine
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    var cancellables = Set<AnyCancellable>()
    
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        viewModel.request()
        
//        APIService().getQuote { result in
//            switch result {
//            case .success(let quote):
////                self.quoteLabel.text = quote.content
//                self.content.send(quote.content)
//            case .failure(let error):
////                self.quoteLabel.text = "에러 발생"
//                print(error)
//            }
//        }
    }
    
    func bindUI() {
        viewModel.content
        .receive(on: DispatchQueue.main)
        .map {Optional($0)}
        .assign(to: \.quoteLabel.text, on: self) // keyPath Expression
        .store(in: &cancellables)
//            .sink { content in // 클로저에서 작동
//                print("데이터 확인")
//                self.quoteLabel.text = content
//            }
    }
    
}
