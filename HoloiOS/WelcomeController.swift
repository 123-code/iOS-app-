//
//  WelcomeController.swift
//  HoloiOS
//
//  Created by alf on 12/18/23.
//

import UIKit

class WelcomeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add your setup code here, such as UI elements, labels, buttons, etc.
        setupUI()
    }
    
    func setupUI() {
        // Example: Create and add a label to the view
        let welcomeLabel = UILabel(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 50))
        welcomeLabel.text = "Welcome!"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(welcomeLabel)
        
        // You can add more UI elements or set up your Welcome screen layout here
    }
    
    // You can add other functions and logic as needed for your Welcome screen
}

