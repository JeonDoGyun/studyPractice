//
//  WeatherInfo.swift
//  WeatherPublisher
//
//  Created by 전도균 on 2022/10/19.
//

import Foundation

struct WeatherInfo: Decodable {
    let main: Main
    
    struct Main: Decodable {
        let temp: Double
    }
}
