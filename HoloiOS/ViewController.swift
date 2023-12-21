//
//  ViewController.swift
//  HoloiOS
//
//  Created by alf on 12/13/23.
//


import UIKit
import Photos
import PhotosUI

class ViewController: UIViewController,PHPickerViewControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Photo Picker "
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add  ,target: self, action:#selector(didTapAdd))
    }
    
    
    @objc private func didTapAdd(){
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 3
        config.filter = .images //PHPickerFilter.any(of:[.images])
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc,animated:true)
        
        
        
    }
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated:true,completion:nil)
        
        results.forEach{result in
            result.itemProvider.loadObject(ofClass:UIImage.self){
                reading, error in
                guard let image  = reading as? UIImage,error == nil else{
                    return
                }
                print(image)
                        
            }
        }
    }
}

/*
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
        let lightBlue = UIColor(red: 0.88, green: 0.93, blue: 5.00, alpha: 2.0)
        view.backgroundColor = lightBlue
        signInButton.addTarget(self,action:#selector(didTapSignIn),for:.touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()

      titlelabel.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
      titlelabel.textAlignment = .center

      subtitlelabel.frame = CGRect(x: 0, y: 300, width: view.frame.width, height: 50)
      subtitlelabel.textAlignment = .center

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
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            let firstName = credentials.fullName?.givenName
            let lastName = credentials.fullName?.familyName
            let email = credentials.email
            
          
            let welcomeVC = WelcomeController()
            
          
            self.present(welcomeVC, animated: true, completion: nil)
            
        default:
            break
        }
    }


}


extension ViewController: ASAuthorizationControllerDelegate{
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
        print("Failed")
    }

}


extension ViewController: ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
 
        return view.window!
    }
}
*/


