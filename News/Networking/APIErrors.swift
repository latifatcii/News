//
//  APIErrors.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation


enum APIErrors: Error {
    case decoding
    case noData
    case badRequest
    case unauthorized
    case tooManyRequests
    case server
    
    var localizedDescription: String {
        switch self {
        case .decoding:
            return "Decoding Error"
        case .noData:
            return "0 data returned from server"
        case .badRequest:
            return "The request was unacceptable, often due to a missing or misconfigured parameter."
        case .unauthorized:
            return "Your API key was missing from the request, or wasn't correct."
        case .tooManyRequests:
            return "You made too many requests within a window of time and have been rate limited. Back off for a while."
        case .server:
            return "Something went wrong on server side."
        }
    }
}
