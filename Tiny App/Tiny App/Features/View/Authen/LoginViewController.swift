//
//  LoginViewController.swift
//  Tiny App
//
//  Created by Hockey on 12/18/20.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    var viewModel: SocialViewModel! {
        didSet {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SocialViewModel(viewController: self)
        // Do any additional setup after loading the view.
//        let loginButton = FBLoginButton()
//        loginButton.center = view.center
//        view.addSubview(loginButton)
    }
    
    @IBAction func loginWithFB(_ sender: Any) {
        viewModel.tapFBLogin()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
