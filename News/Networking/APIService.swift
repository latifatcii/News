//
//  APIService.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation

final class APIService: APIClient {
    func fetchTopHeadline(from page: Int, success: @escaping (TopHeadlineModel) -> Void, failed: @escaping (APIErrors) -> Void) {
        fetch(router: .topHeadline(page: page), success: success, failed: failed)
    }
}
