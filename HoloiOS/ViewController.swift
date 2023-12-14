//
//  ViewController.swift
//  HoloiOS
//
//  Created by alf on 12/13/23.
//
import AuthenticationServices
import UIKit

class ViewController: UIViewController {
    
    private let signInButton = ASAuthorizationAppleIDButton()
       
    let titlelabel:UILabel = {
        let label = UILabel()
        label.text = "Holo"
        label.font = UIFont(name:"Futura",size:24)
        label.textAlignment = .center
        return label
    }()
    
    let subtitlelabel:UILabel = {
        let label = UILabel()
        label.text = "Sign up to get started"
        label.font = UIFont(name:"Futura",size:18)
        label.textAlignment = .center
        return label
    }()
    
     

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titlelabel)
        view.addSubview(subtitlelabel)
        view.addSubview(signInButton)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titlelabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        subtitlelabel.frame = CGRect(x: 10, y: 200, width: view.frame.width, height: 50)
        signInButton.frame = CGRect(x:0,y:10,width:250,height:50)
        signInButton.center=view.center
    }


}

