//
//  UnitView.swift
//  BMICalculater
//
//  Created by Muhammed Emin Bardakcı on 18.04.2023.
//

import UIKit

enum unitType {
    case weight, height
}

class UnitView: UIView {

    let text = BMIText(color: .white, text: "???")
    let slider = BMISlider()
    
    var value = 0
    var type: unitType!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(type: unitType) {
        self.init(frame: .zero)
        
        self.type = type
        switch type {
        case .height:
            text.text = "Height(cm): \(value)"
            slider.maximumValue = 300
        case .weight:
            text.text = "Weight(kg): \(value)"
            slider.maximumValue = 200
        }
    }
    
    private func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubviews(text, slider)
        self.pinToSides(views: text, slider)
        
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            text.heightAnchor.constraint(equalToConstant: 50),
            
            slider.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 15),
            slider.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        value = Int(round(sender.value))
        
        switch type {
        case .height:
            text.text = "Height(cm): \(value)"
        case .weight:
            text.text = "Weight(kg): \(value)"
        case .none:
            return
        }
    }
}
