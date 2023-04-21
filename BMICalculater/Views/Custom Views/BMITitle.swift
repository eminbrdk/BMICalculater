//
//  BMITitle.swift
//  BMICalculater
//
//  Created by Muhammed Emin Bardakcı on 18.04.2023.
//

import UIKit

class BMITitle: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor, text: String) {
        self.init(frame: .zero)
        
        self.textColor = color
        self.text = text
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        textAlignment = .center
        numberOfLines = 1
        lineBreakMode = .byTruncatingTail
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
    }
}
