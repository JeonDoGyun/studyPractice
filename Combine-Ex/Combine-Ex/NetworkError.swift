//
//  NetworkError.swift
//  Combine-Ex
//
//  Created by 전도균 on 2022/10/17.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badResponse
    case communicationError
    case decodeFailed
    case noData
}
