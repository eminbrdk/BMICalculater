//
//  BMIText.swift
//  BMICalculater
//
//  Created by Muhammed Emin Bardakcı on 18.04.2023.
//

import UIKit

class BMIText: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor, text: String) {
        self.init(frame: .zero)
        
        self.text = text
        self.textColor = color
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textAlignment = .left
        numberOfLines = 1
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
    }
    
}
