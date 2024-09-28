//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Muhammad Shayan on 23/08/2024.
//

import UIKit

struct UIHelper {
    
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimunItemSpacing: CGFloat = 10
        let availableWidth = width - (2 * padding) - (minimunItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        collectionFlowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return collectionFlowLayout
    }
}
