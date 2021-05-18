//
//  URLSession-Codable.swift
//  MyMovies
//
//  Created by Paul Hudson on 16/05/2021.
//

import Combine
import Foundation

extension URLSession {
    func fetch<T: Decodable>(_ url: URL, defaultValue: T, completion: @escaping (T) -> Void) -> AnyCancellable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return self.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: completion)
    }
    
    func fetch<T: Decodable>(_ url: URL, defaultValue: T) -> AnyPublisher<T, Never> {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return self.dataTaskPublisher(for: url)
            .retry(1)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .replaceError(with: defaultValue)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func get<T: Decodable>(path: String, queryItems: [String: String] = [:], defaultValue: T, completion: @escaping (T) -> Void) -> AnyCancellable? {
        guard let components = URLComponents(string: "https://we046wmwwi.execute-api.us-east-2.amazonaws.com/develop/apodQuery/NASA/\(path)") else {
            return nil
        }
        
//        components.queryItems = queryItems.map(URLQueryItem.init)
        
        if let url = components.url {
            return fetch(url, defaultValue: defaultValue, completion: completion)
        } else {
            return nil
        }
    }
    
    func post<T: Encodable>(_ data: T, to url: URL, completion: @escaping (String) -> Void) -> AnyCancellable {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        request.httpBody = try? encoder.encode(data)
        
        return dataTaskPublisher(for: request)
            .map { data, response in
                String(decoding: data, as: UTF8.self)
            }
            .replaceError(with: "Decode error")
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: completion)
    }
}
