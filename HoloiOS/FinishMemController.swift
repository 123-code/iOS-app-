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

    var date: Date? {
        didSet {
            if let date = date {
                // Perform date formatting or update label/textField here
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let lightBlue = UIColor(red: 0.88, green: 0.93, blue: 5.00, alpha: 2.0)
        view.backgroundColor = lightBlue

        // Date Picker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 100, width: view.frame.width - 40, height: 200)
        view.addSubview(datePicker)

        // Label 1 (Field 1)
        label1.text = "Field 1"
        label1.frame = CGRect(x: 20, y: datePicker.frame.maxY + 20, width: 100, height: 30)
        view.addSubview(label1)
        // Text Field 1
        textField.borderStyle = .roundedRect
        textField.frame = CGRect(x: 20, y: label1.frame.maxY + 8, width: view.frame.width - 40, height: 30)
        view.addSubview(textField)

        // Label 2 (Field 2)
        label2.text = "Field 2"
        label2.frame = CGRect(x: 20, y: textField.frame.maxY + 20, width: 100, height: 30)
        view.addSubview(label2)

        // Text Field 2
        textField2.borderStyle = .roundedRect
        textField2.frame = CGRect(x: 20, y: label2.frame.maxY + 8, width: view.frame.width - 40, height: 30)
        view.addSubview(textField2)
    }
}
