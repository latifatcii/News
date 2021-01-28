//
//  HomeViewContracts.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation

protocol HomeViewModelProtocol {
    var news: [Article] { get }
    var delegate: HomeViewModelDelegate? { get set }
    var service: APIClient { get }
    func loadNews(from page: Int)
    func favNews(at index: Int)
    func unfavNews(at index: Int)
    func checkIsNewsFavorite(at index: Int, completion: @escaping((Bool) -> Void))
}

enum HomeViewState {
    case loading(Bool)
    case show
    case error(String)
}

protocol HomeViewModelDelegate: class {
    func viewModel(_ output: HomeViewState)
}
