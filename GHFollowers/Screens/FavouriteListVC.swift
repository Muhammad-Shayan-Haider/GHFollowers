//
//  FavouriteListVC.swift
//  GHFollowers
//
//  Created by Muhammad Shayan on 22/08/2024.
//

import UIKit

class FavouriteListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        PersistenceManager.retrieveFavourites(completed: { result in
            switch result {
            case .success(let favourites):
                print(favourites)
            case .failure(let error):
                break
            }
        })
    }

}
