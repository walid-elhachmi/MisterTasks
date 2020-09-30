//
//  NetworkManager.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import Foundation

typealias CompletionHandler<T: Codable> = Result<T, APIError>

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(url: String, completion: @escaping (CompletionHandler<T>) -> Void) {
        
        guard let url = URL(string: API.baseURL + url) else {
            completion(.failure(.invalidEndPoint))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.connection(error)))
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let value = try JSONDecoder().decode(T.self, from: data)
                completion(.success(value))
            } catch {
                completion(.failure(.decodeError))
            }
        }
        
        task.resume()
        
        
    }
    
}
