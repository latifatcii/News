//
//  TabBarViewController.swift
//  News
//
//  Created by Latif Atci on 1/27/21.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItems()
    }
    
    private func setTabBarItems() {
        
        //Set HomeViewController as a first tab at TabBarController
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeVC.viewModel = HomeViewModel()
        homeVC.view.backgroundColor = .white
        homeVC.title = "News"
        let homeNC = UINavigationController(rootViewController: homeVC)
        homeNC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        //Set FavoritesViewController as a first tab at TabBarController
        let favoritesVC = FavoritesViewController()
        favoritesVC.view.backgroundColor = .white
        let favoritesNC = UINavigationController(rootViewController: favoritesVC)
        favoritesNC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        setViewControllers([homeNC, favoritesNC], animated: true)
    }
}
