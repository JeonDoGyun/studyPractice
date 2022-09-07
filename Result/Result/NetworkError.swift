//
//  NetworkError.swift
//  Result
//
//  Created by 전도균 on 2022/09/07.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case badResponse
    case communicationError
    case decodeFailed
    case noData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badUrl:
            return "1"
        case .badResponse:
            return "2"
        case .communicationError:
            return "응답이 잘못되었습니다."
        case .decodeFailed:
            return "3"
        case .noData:
            return "4"
        }
    }
}
