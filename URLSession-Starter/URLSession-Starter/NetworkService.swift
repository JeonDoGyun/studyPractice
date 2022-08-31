//
//  NetworkService.swift
//  URLSession-Starter
//
//  Created by 전도균 on 2022/08/31.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func fetch(urlString: String, completion: @escaping(WeatherInfo) -> Void) { // NetworkService 바깥에서 실행되는 부분이기 때문, 클로저의 행동이 바깥에서 결정될 때
        // Background Thread
        // self.temperatureLabel.text = String(decodedData.main.temp) // UI 관련 작업 - Main Thread

        URLSession.shared.dataTask(with: URL(string: urlString)!) { data, response, error in
            guard error == nil else { fatalError() } // 원래는 오류 떴을 때 어떻게 해야될지 alert를 띄우거나 해야되는데 바로 확인하려고 fatalError() 넣은 거
            guard let response = response as? HTTPURLResponse,
                  (200..<400).contains(response.statusCode) else { fatalError() }
            guard let data = data else { return }
            do {
                let weatherInfo = try JSONDecoder().decode(WeatherInfo.self, from: data)
                DispatchQueue.main.async {
                    completion(weatherInfo)
                }
            } catch {
                fatalError()
            }
        }.resume()
    }
}
