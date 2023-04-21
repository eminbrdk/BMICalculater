//
//  ResultVC.swift
//  BMICalculater
//
//  Created by Muhammed Emin Bardakcı on 18.04.2023.
//

import UIKit

class ResultVC: UIViewController {

    var bmi: Float!
    
    let result = BMITitle(color: .white, text: "???")
    let classImage = UIImageView()
    let classification = BMITitle(color: .lightGray, text: "???")
    let goBackButton = BMIButton(text: "Ok", color: .cyan)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureImage()
    }
    
    func configureImage() {
        classImage.translatesAutoresizingMaskIntoConstraints = false
        
        classImage.contentMode = .scaleAspectFill
        classImage.clipsToBounds = true
        classImage.layer.cornerRadius = 7
    }
    
    private func configureView() {
        let padding: CGFloat = 20
        let imageHeight: CGFloat = view.frame.width - 2 * padding
        
        view.backgroundColor = BMIColor.viewBackgroundColor
        result.text = "Your BMI: \(bmi!)"
        
        var classificationText: String!
        if bmi < 18.5 {
            classificationText = "Underweight"
            classImage.image = UIImage(named: "1")
        } else if bmi < 25  {
            classificationText = "Normal"
            classImage.image = UIImage(named: "2")
        } else if bmi < 30  {
            classificationText = "Overweight"
            classImage.image = UIImage(named: "3")
        } else if bmi < 35  {
            classificationText = "Obese class 1"
            classImage.image = UIImage(named: "4")
        } else if bmi < 40  {
            classificationText = "Obese class 2"
            classImage.image = UIImage(named: "5")
        } else {
            classificationText = "Obese class 3"
            classImage.image = UIImage(named: "6")
        }
        classification.text = classificationText
        
        view.addSubviews(result, classification, goBackButton, classImage)
        view.pinToSides(padding: padding, views: result, classification, goBackButton, classImage)
        
        NSLayoutConstraint.activate([
            result.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            result.heightAnchor.constraint(equalToConstant: 45),
            
            classImage.topAnchor.constraint(equalTo: result.bottomAnchor, constant: 20),
            classImage.heightAnchor.constraint(equalToConstant: imageHeight),
            
            classification.topAnchor.constraint(equalTo: classImage.bottomAnchor, constant: 10),
            classification.heightAnchor.constraint(equalToConstant: 45),
            
            goBackButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            goBackButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        goBackButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        dismiss(animated: true)
    }
}
