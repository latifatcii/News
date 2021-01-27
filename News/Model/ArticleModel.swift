//
//  ArticleModel.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation

struct Article: Decodable {
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?

    enum CodingKeys: String, CodingKey {
        case author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}
