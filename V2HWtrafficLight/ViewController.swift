//
//  ViewController.swift
//  V2HWtrafficLight
//
//  Created by Oleksii Holub on 11.03.2023.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {

    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private var lightIsOn: CGFloat = 1
    private var lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        print("размер стороны доступны из viewDidLoad", redLight.frame.height)
    }

    override func viewWillLayoutSubviews() {
        
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
        
        print("размер стороны доступны из viewWillLayoutSubviews", redLight.frame.height)
    }

    @IBAction func startButtonPressed() {
        
        startButton.setTitle("Next", for: .normal)
        
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentLight = .red
            
        }
    }
    
}

