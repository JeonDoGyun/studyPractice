//
//  ViewController.swift
//  Result
//
//  Created by 전도균 on 2022/09/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        throwingGetQuote { result in
            switch result {
            case .success(let data):
                do {
                    let quote = try self.decodeData(data: data)
                    print(quote)
                } catch {
                    print(error)
                }
                
            case .failure(let error):
                print("Network Error")
                switch error {
                case .communicationError:
                    print(error.localizedDescription)
                default:
                    break
                }
            }
        }
        
//        getQuote { result in
//            switch result {
//            case .success(let quote):
//                print(quote)
//            case .failure(let error):
//                print(error.localizedDescription) // localizedDescription : 에러코드를 개발자가 읽기 편하게 만들어준 거
//            }
//        }
    }
}

extension ViewController {
    private func getQuote(completion: @escaping (Result<Quote, NetworkError>) -> Void) {
        let url = URL(string: "https://api.quotable.io/random")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                completion(.failure(.communicationError))
                return
            }
            guard let response = response as? HTTPURLResponse,
            (200..<300).contains(response.statusCode) else {
                completion(.failure(.badResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let quote = try JSONDecoder().decode(Quote.self, from: data)
                completion(.success(quote))
            } catch {
                print(error)
            }
        }.resume()
    }
    
    private func throwingGetQuote(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        let url = URL(string: "https://api.quotable.io/random")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                // throw - error 뜸
                completion(.failure(.communicationError))
                return
            }
            guard let response = response as? HTTPURLResponse,
            (200..<300).contains(response.statusCode) else {
                completion(.failure(.badResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
    
    private func decodeData(data: Data) throws -> Quote? {
        return try JSONDecoder().decode(Quote.self, from: data)
    }
}
