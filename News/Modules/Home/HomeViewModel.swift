//
//  HomeViewModel.swift
//  News
//
//  Created by Latif Atci on 1/28/21.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    
    var service: APIClient
    var news = [Article]()
    weak var delegate: HomeViewModelDelegate?

    init(_ service: APIClient = APIService()) {
        self.service = service
    }
    
    func loadNews(from page: Int) {
        delegate?.viewModel(.loading(true))
        service.fetch(router: .topHeadline(page: page), success: loadingSuccess, failed: loadingFailed)
    }
    
    private func loadingSuccess(with news: TopHeadlineModel) {
        self.news = news.articles
        delegate?.viewModel(.show)
        delegate?.viewModel(.loading(false))
        
    }
    
    private func loadingFailed(with error: APIErrors) {
        delegate?.viewModel(.loading(false))
        switch error {
        case .badRequest:
            delegate?.viewModel(.error(error.localizedDescription))
        case .decoding:
            delegate?.viewModel(.error(error.localizedDescription))
        case .noData:
            delegate?.viewModel(.error(error.localizedDescription))
        case .server:
            delegate?.viewModel(.error(error.localizedDescription))
        case .tooManyRequests:
            delegate?.viewModel(.error(error.localizedDescription))
        case .unauthorized:
            delegate?.viewModel(.error(error.localizedDescription))
        }
    }
    
    func favNews() {
        
    }
    
}
