//
//  ViewController.swift
//  TinyApp
//
//  Created by Hockey on 12/17/20.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        loginButton.permissions = ["public_profile", "email"]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let token = AccessToken.current,
           !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            print("Login")
        }
    }
    
    
}

