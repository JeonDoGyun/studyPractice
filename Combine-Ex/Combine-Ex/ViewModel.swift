//
//  ViewModel.swift
//  Combine-Ex
//
//  Created by 전도균 on 2022/10/17.
//

import Combine
import Foundation

class ViewModel {
    var content = PassthroughSubject<String, Never>()
    
    func request() {
        Task {
            let quote = try await APIService().getQuote()
            content.send(quote.content)
        }
    }
}
