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
    convenience init(color: UIColor, title: String, systemImageName: String) {
        self.init(frame: .zero)
        
        set(color: color, title: title, systemImageName: systemImageName)
    }
    
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        // To use autolayout.
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func set(color: UIColor, title: String, systemImageName: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
    
}
