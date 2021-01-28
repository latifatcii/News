//
//  HomeViewController.swift
//  News
//
//  Created by Latif Atci on 1/27/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: HomeViewModelProtocol!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.loadNews(from: 1)
        activityIndicator.hidesWhenStopped = true
        setTableView()
    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: HomeTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.reuseIdentifier)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = viewModel.news[indexPath.row].title
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func viewModel(_ output: HomeViewState) {
        switch output {
        case .loading(let loading):
            DispatchQueue.main.async {
                if loading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        case .show:
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .error(let error):
            DispatchQueue.main.async {
                self.showAlert(with: error)
            }
        }
    }
}

extension HomeViewController: HomeTableViewCellDelegate {
    func favButtonTapped(indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? HomeTableViewCell
        
        viewModel.checkIsNewsFavorite(at: indexPath.row) { [weak self] (isFav) in
            guard let self = self else { return }
            
            if isFav {
                self.viewModel.unfavNews(at: indexPath.row)
            } else {
                self.viewModel.favNews(at: indexPath.row)
            }

            cell?.switchFavButtonImage(isDataFavorited: isFav)
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
    
    
}
