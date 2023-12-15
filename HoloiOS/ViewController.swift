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
        signInButton.addTarget(self,action:#selector(didTapSignIn),for:.touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        titlelabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        subtitlelabel.frame = CGRect(x: 10, y: 200, width: view.frame.width, height: 50)
        signInButton.frame = CGRect(x:0,y:10,width:250,height:50)
        signInButton.center=view.center
    }
    
    @objc func didTapSignIn(){
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName,.email]
        
        let controller = ASAuthorizationController(authorizationRequests:[request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()

}

}


extension ViewController: ASAuthorizationControllerDelegate{
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
        print("Failed")
    }
     
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
   
        switch authorization.credential{
        case let credentials as ASAuthorizationAppleIDCredential:
            let firstName = credentials.fullName?.givenName
            let lastName = credentials.fullName?.familyName
            let email = credentials.email
            
            break
        default:
            break
        }
    }
}


extension ViewController: ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
 
        return view.window!
    }
}


