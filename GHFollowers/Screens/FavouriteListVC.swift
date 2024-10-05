//
//  FavouriteListVC.swift
//  GHFollowers
//
//  Created by Muhammad Shayan on 22/08/2024.
//

import UIKit

class FavouriteListVC: UIViewController {
    
    let tableView = UITableView()
    var favourites: [Follower] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getFavourites()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Favourites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.register(FavouriteCell.self, forCellReuseIdentifier: FavouriteCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func getFavourites() {
        PersistenceManager.retrieveFavourites(completed: { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let favourites):
                if (favourites.isEmpty) {
                    self.showEmptyStateView(with: "No Favourites?\nAdd one on the follower screen", in: self.view)
                } else {
                    self.favourites = favourites
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
            }
        })
    }

}

extension FavouriteListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavouriteCell.reuseIdentifier) as! FavouriteCell
        let favourite = favourites[indexPath.row]
        cell.set(favourite: favourite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favourite = favourites[indexPath.row]
        let destVC = FollowerListVC()
        destVC.username = favourite.login
        destVC.title = favourite.login
        
        navigationController?.pushViewController(destVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        let favourite = favourites[indexPath.row]
        favourites.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        
        PersistenceManager.updateWith(favourite: favourite, actionType: .remove) { [weak self] error in
            guard let self else { return }
            
            guard let error else { return }
            self.presentGFAlertOnMainThread(title: "Unable to remove", message: error.rawValue, buttonTitle: "Ok")
        }
    }
}
