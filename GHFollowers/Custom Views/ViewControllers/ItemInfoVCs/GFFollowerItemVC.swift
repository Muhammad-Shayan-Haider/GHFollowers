//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Muhammad Shayan on 29/09/2024.
//

import Foundation

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
