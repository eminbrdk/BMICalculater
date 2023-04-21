//
//  BMIButton.swift
//  BMICalculater
//
//  Created by Muhammed Emin Bardakcı on 18.04.2023.
//

import UIKit

class BMIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, color: UIColor) {
        self.init(frame: .zero)
        
        configuration?.title = text
        configuration?.baseForegroundColor = color
        configuration?.baseBackgroundColor = color
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        configuration = .tinted()
    }
}
