//
//  GFButton.swift
//  GHFollowers
//
//  Created by Muhammad Shayan on 22/08/2024.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        // Basic button initialization
        super.init(frame: frame)
        
        // Customization
        configure()
    }
    
    // Required to initialize the button in the storyboard.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Custom init
    init(backgroudColor: UIColor, title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroudColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        // Layer is responsible for drawing the view content.
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        // Configurable font size to be dynamic
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        // To use autolayout.
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(backgroundColor: UIColor, title: String) {
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
}
