//
//  GFTabBarController.swift
//  GHFollowers
//
//  Created by Muhammad Shayan on 05/10/2024.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNavigationController(), createFavouritesNavigationController()]
    }
    

    func createSearchNavigationController() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    func createFavouritesNavigationController() -> UINavigationController {
        let favouritesListVC = FavouriteListVC()
        favouritesListVC.title = "Favourites"
        favouritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favouritesListVC)
    }

}
