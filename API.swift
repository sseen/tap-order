//
//  API.swift
//  TapOrder (iOS)
//
//  Created by solo on 2/23/22.
//

import Foundation
import UIKit
import Combine

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}

protocol RequestBuilder {
    var urlRequest: URLRequest {get}
}

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
    func requestImage(with url: String) -> AnyPublisher<UIImage, APIError>
}
