//
//  NetworkError.swift
//  Async-Await-Ex
//
//  Created by 전도균 on 2022/09/19.
//

import Foundation

enum NetworkError: Error {
    case badResponse
    case communicationError
    case decodeFailed
    case noData
}
