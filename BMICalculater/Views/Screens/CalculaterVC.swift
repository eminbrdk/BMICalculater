//
//  CalculaterVC.swift
//  BMICalculater
//
//  Created by Muhammed Emin Bardakcı on 18.04.2023.
//

import UIKit

class CalculaterVC: UIViewController {

    let calculaterTitle = BMITitle(color: .white, text: "BMI CALCULATER")
    let weightView = UnitView(type: .weight)
    let heightView = UnitView(type: .height)
    let calculateButton = BMIButton(text: "Calculate", color: .green)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = BMIColor.viewBackgroundColor
        
        view.addSubviews(calculaterTitle, weightView, heightView, calculateButton)
        view.pinToSides(padding: 20,views: calculaterTitle, weightView, heightView, calculateButton)
        
        NSLayoutConstraint.activate([
            calculaterTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            calculaterTitle.heightAnchor.constraint(equalToConstant: 60),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            
            heightView.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -25),
            heightView.heightAnchor.constraint(equalToConstant: 150),
            
            weightView.bottomAnchor.constraint(equalTo: heightView.topAnchor, constant: -15),
            weightView.heightAnchor.constraint(equalToConstant: 150),
        ])
        
        calculateButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        let weight = weightView.slider.value
        let height = heightView.slider.value / 100
        let bmi = round(weight / (height * height))
        
        guard weight != 0, height != 0 else {
            let alert = UIAlertController(title: "Opss", message: "Please entere weight and height", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
            present(alert, animated: true)
            return
        }
        
        let vc = ResultVC()
        vc.bmi = bmi
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
    }
}
