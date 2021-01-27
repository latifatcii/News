//
//  APIMethod.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

protocol APIMethod {
    var httpMethod: HttpMethod { get }
    var host: String { get }
    var scheme: String { get }
    var path: String { get }
    var parameters: [String: Any] { get }
    var apiKey: String { get }
}

extension APIMethod {
    
    var httpMethod: HttpMethod {
        return .get
    }
    
    var host: String {
        return "newsapi.org"
    }
    
    var scheme: String {
        "https"
    }
    
    var path: String {
        return "/v2/top-headlines"
    }
    
    var apiKey: String {
        return ""
    }
    
    func createURLRequest() -> URLRequest? {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        
        
        var queryItems: [URLQueryItem] = []
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            queryItems.append(queryItem)
        }
        
        urlComponents.queryItems = queryItems
        
        if let url = urlComponents.url {
            return URLRequest(url: url)
        } else {
            return nil
        }
        
        
    }
}
