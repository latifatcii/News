//
//  TopHeadlineModel.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation

struct TopHeadlineModel: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
