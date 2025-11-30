//
//  NetworkManager.swift
//  NetworkLibrary
//
//  Created by Atinati on 08.11.25.
//

import Foundation

public enum NetworkError: Error {
    case noData
    case invalidURL
    case decodingFailed
    case invalidResponse
    
    public var localizedDescription: String {
        switch self {
        case .noData:
            return "No data received from server"
        case .invalidURL:
            return "Invalid URL provided"
        case .decodingFailed:
            return "Failed to decode response data"
        case .invalidResponse:
            return "Invalid server response"
        }
    }
}

public class NetworkManager {
    
    public init() {}
    
    public func getData<T: Decodable>(url: String, completion: @escaping(Result<T, Error>) -> ()) {
        
        guard let validURL = URL(string: url) else {
            DispatchQueue.main.async { completion(.failure(NetworkError.invalidURL)) }
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: validURL)) { data, response, error in
            
            if let error {
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                DispatchQueue.main.async { completion(.failure(NetworkError.noData)) }
                return
            }
            
            guard let data else {
                DispatchQueue.main.async { completion(.failure(NetworkError.decodingFailed)) }
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async { completion(.success(decodedObject)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(NetworkError.invalidResponse)) }
            }
        }.resume()
    }
}
