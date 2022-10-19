//
//  WeatherService.swift
//  WeatherPublisher
//
//  Created by 전도균 on 2022/10/19.
//

import Combine
import Foundation


struct WeatherService {
    func getWeather(city: String) -> AnyPublisher<WeatherInfo, Error> {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid={apikey}")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { publisher in
                return publisher.data
            }
            .decode(type: WeatherInfo.self, decoder: JSONDecoder())
//            .map { weatherInfo in // main 가져오기
//                return weatherInfo.main
//            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher() // 중복되는 표현들 때문에 마침표 느낌으로 애플에서 만든 함수
    }
}
