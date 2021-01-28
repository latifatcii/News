//
//  APIRouter.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation

enum APIRouter {
    case topHeadline(page: Int)
}

extension APIRouter: APIMethod {
    var parameters: [String : Any] {
        switch self {
            case .topHeadline(let page):
                return ["page": page, "apiKey": Key.apiKey.rawValue, "category": "general", "language": "en"]
        }
    }
    
    
}
