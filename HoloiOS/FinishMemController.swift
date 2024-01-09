//
//  FinishMemController.swift
//  HoloiOS
//
//  Created by Jose Ignacio Naranjo on 12/27/23.
//

import UIKit

class FinishMemController: UIViewController {
    let datePicker = UIDatePicker()
    let textField = UITextField()
    let textField2 = UITextField()
    let label0 = UILabel()
    let label1 = UILabel()
    let label2 = UILabel()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        datePicker.isUserInteractionEnabled = false
        textField.isUserInteractionEnabled = false
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        datePicker.isUserInteractionEnabled = true
        textField.isUserInteractionEnabled = true
    }
    
    private let nextButton: UIButton = {
          let button = UIButton(type: .system)
          button.setTitle("Next", for: .normal)
          button.setTitleColor(.white, for: .normal)
          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
          button.backgroundColor = .black
          button.layer.cornerRadius = 10
       
          /*button.addTarget(self, action: #selector(addImageTapped), for: .touchUpInside)
        */
          return button
      }()

    var date: Date? {
        didSet {
            if let date = date {
            
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let lightBlue = UIColor(red: 0.88, green: 0.93, blue: 5.00, alpha: 2.0)
        view.backgroundColor = lightBlue


        label0.text = "Memory Date"
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame = CGRect(x: 10, y: view.safeAreaInsets.top + 100, width: view.frame.width - 80, height: 200)
        view.addSubview(datePicker)

     
        label1.text = "Memory Name"
        label1.font = UIFont(name: "Futura", size: 14)
        label1.frame = CGRect(x: 20, y: datePicker.frame.maxY + 20, width: 200, height: 30)
        view.addSubview(label1)
       
        textField.font = UIFont(name: "Futura", size: 14)
           textField.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
           textField.layer.cornerRadius = 8
           textField.layer.borderWidth = 1.0
           textField.layer.borderColor = UIColor.gray.cgColor
        textField.frame = CGRect(x: 20, y: label1.frame.maxY + 8, width: view.frame.width - 80, height: 30)
        view.addSubview(textField)


        label2.text = "Additional context"
        label2.font = UIFont(name: "Futura", size: 14)
        label2.frame = CGRect(x: 20, y: textField.frame.maxY + 20, width: 200, height: 30)
        view.addSubview(label2)


        textField2.borderStyle = .roundedRect
        textField2.font = UIFont(name: "Futura", size: 14)
        textField2.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        textField2.layer.cornerRadius = 8
        textField2.layer.borderWidth = 1.0
        textField2.layer.borderColor = UIColor.gray.cgColor
        textField2.frame = CGRect(x: 20, y: label2.frame.maxY + 8, width: view.frame.width - 40, height: 30)
        view.addSubview(textField2)
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            nextButton.widthAnchor.constraint(equalToConstant: 150),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])

   
        if let futuraFont = UIFont(name: "Futura", size: 14) {
            nextButton.titleLabel?.font = futuraFont
        }
}
}
