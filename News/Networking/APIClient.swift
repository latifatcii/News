//
//  APIClient.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation

protocol APIClient {
    func fetch<T: Decodable>(router: APIRouter, success: @escaping (T) -> Void, failed: @escaping (APIErrors) -> Void)
}

extension APIClient {
    func fetch<T: Decodable>(router: APIRouter, success: @escaping (T) -> Void, failed: @escaping (APIErrors) -> Void) {
        guard let request = router.createURLRequest() else { return }
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { (data, urlResponse, error) in
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                failed(.badRequest)
                return
            }
            
            if httpResponse.statusCode == 200 {
                guard let data = data else {
                    failed(.noData)
                    return
                }
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    success(model)
                } catch {
                    failed(.decoding)
                }
            } else if httpResponse.statusCode == 400 {
                failed(.badRequest)
            } else if httpResponse.statusCode == 401 {
                failed(.unauthorized)
            } else if httpResponse.statusCode == 429 {
                failed(.tooManyRequests)
            } else {
                failed(.server)
            }
        }.resume()
    }
    
    
}
