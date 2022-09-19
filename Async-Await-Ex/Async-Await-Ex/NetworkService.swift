//
//  NetworkService.swift
//  Async-Await-Ex
//
//  Created by 전도균 on 2022/09/19.
//

import Foundation

class NetworkService {
    let url = URL(string: "https://api.quotable.io/random")!
    
    static let shared = NetworkService()
    
    private init() {}
    
    func getQuote(completion: @escaping (Result<String, NetworkError>) -> Void) -> String {
        var result = "TEST"
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(.failure(.communicationError))
                return
            }
            
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode) {
                completion(.failure(.badResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let quote = try JSONDecoder().decode(Quote.self, from: data)
                print(quote)
                result = quote.content
                completion(.success(result))
            } catch {
                print(error)
                completion(.failure(.decodeFailed))
            }
        }.resume()
        return result
    }
    
    // 기존 함수를 수정하지 않고 덮어씌운 뒤 호출 / 기존 함수의 내용을 잘 모르겠을 때 async로 사용하고 싶으면 사용
    func continuationGetQuote() async -> String {
        return await withCheckedContinuation { continuation in
            getQuote { result in
                switch result {
                case .success(let quote):
                    continuation.resume(returning: quote) // resume()은 딱 1번만 나와야 됨
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func getQuote() async -> String { // async 블록 안에 들어가있을 때는 Task 안에 집어넣지 않아도 await 사용가능
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            if let response = response as? HTTPURLResponse,
               !(200..<300).contains(response.statusCode) {
                return "응답에러"
            }
            let quote = try JSONDecoder().decode(Quote.self, from: data)
            return quote.content
        } catch {
            return "Decode 에러"
        }
    }
    
    // 이전꺼가 끝나는걸 기다리지 않고 실행 가능 / await이 배열에 걸려있기 때문에 / 순서 보장되지 않음
    func getQuotes() async -> [String] {
        async let firstQuote = getQuote()
        async let secondQuote = getQuote()
        async let thirdQuote = getQuote()
        return await [firstQuote, secondQuote, thirdQuote]
        
        // () 안에서도 await 사용 가능
//        var quotes = [String]()
//        for _ in 1...3 {
//            quotes.append(await getQuote())
//        }
//        return quotes
    }
    
    // 2가 시작하려면 1이 끝나야 실행 가능 / 대신 순서 보장됨
    func getQuotes1() async -> [String] {
        let firstQuote = await getQuote()
        let secondQuote = await getQuote()
        let thirdQuote = await getQuote()
        return [firstQuote, secondQuote, thirdQuote]
    }
}
