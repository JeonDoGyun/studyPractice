//
//  WeatherInfo.swift
//  URLSession-Starter
//
//  Created by 전도균 on 2022/08/31.
//

import Foundation

struct WeatherInfo: Codable { // struct 자체가 1개의 dictionary라 생각하면 됨. json파일에서 원하는 데이터를 가져올 수 있음.
    
    let main: Main
    let weather: [Weather]
    
    struct Main: Codable {
        let temp: Double
        let feels_like: Double
    }
    
    struct Weather: Codable {
        let main: String
    }
}
