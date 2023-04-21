//
//  UIView+Ext.swift
//  BMICalculater
//
//  Created by Muhammed Emin Bardakcı on 18.04.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for item in views {
            self.addSubview(item)
        }
    }
    
    func pinToSides(padding: CGFloat = 0, views: UIView...) {
        for item in views {
            NSLayoutConstraint.activate([
                item.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
                item.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
            ])
        }
    }
}
