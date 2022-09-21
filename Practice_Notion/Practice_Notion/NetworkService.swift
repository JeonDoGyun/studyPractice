//
//  NetworkService.swift
//  Practice_Notion
//
//  Created by 전도균 on 2022/09/21.
//

import Foundation

class NetworkService {
    let url = URL(string: "https://api.quotable.io/random")!
    static let shared = NetworkService()
    
    private init() {}
    
    func getQuote(completion: @escaping (String) -> Void) -> String {
        var result = "Test" // 1
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode) {
                return
            }
            guard let data = data else {
                return
            }
            do {
                let quote = try JSONDecoder().decode(Quote.self, from: data)
//                print(quote)
                result = quote.content // 2
                completion(result)
            } catch {
                print(error)
            }
        }.resume()
        
        return result // 3
    }
}
