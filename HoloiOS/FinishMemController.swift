//
//  FinishMemController.swift
//  HoloiOS
//
//  Created by Jose Ignacio Naranjo on 12/27/23.
//

import UIKit

class FinishMemController: UIViewController {

    let imageView = UIImageView()
    let dateLabel = UILabel()
    let titleLabel = UILabel()
    let contextTextView = UITextView()

    var date: Date? {
        didSet {
            if let date = date {
                dateLabel.text = date.formatted()
            }
        }
    }
    
    override var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var context: String? {
        didSet {
            contextTextView.text = context
        }
    }

     init(frame:CGRect) {
        super.init(nibName: nil, bundle: nil)
        
        // Round image view
        imageView.layer.cornerRadius = frame.width / 2
        imageView.clipsToBounds = true
        
        // Date label
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .secondaryLabel
        
        // Title label
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        // Context text view
        contextTextView.font = .systemFont(ofSize: 14)
        contextTextView.isEditable = false
        contextTextView.isScrollEnabled = false
        
        // Layout
        // ...add dateLabel, titleLabel, contextTextView
    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
