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
            self.viewModel.gotoMainTab = { [weak self] in
                self?.willGoToMainTab()
            }
            
            self.viewModel.gotoHome = { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                
                let homeStory = UIStoryboard(name: "Home", bundle: nil)
                if let homeVC = homeStory.instantiateViewController(withIdentifier: "SurveyViewController") as? SurveyViewController {
                    
                    strongSelf.navigationController?.pushViewController(homeVC, animated: true)
                }
                
            }
        }
    }
    
    func willGoToMainTab() {
        let homeStory = UIStoryboard(name: "Home", bundle: nil)
        if let tabBarCtrl = homeStory.instantiateViewController(withIdentifier: "mainTab") as? UITabBarController {
            
            if #available(iOS 13.0, *) {
                sceneDelegate?.window?.rootViewController = tabBarCtrl
            } else {
                
                appDelegate?.window?.rootViewController = tabBarCtrl
                appDelegate?.window?.makeKeyAndVisible()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SocialViewModel(viewController: self)
        let library_path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        
        let userDefault = UserDefaults.standard
        if let jet = userDefault.string(forKey: "loggedIn"), jet == "1" {
            
            willGoToMainTab()
        }
        print("library path is \(library_path)")
    }
    
    @IBAction func doLogin(_ sender: Any) {
        self.willGoToMainTab()
    }
    
    @IBAction func loginWithFB(_ sender: Any) {
        let userDefault = UserDefaults.standard
        guard let _ = userDefault.string(forKey: "loggedIn") else {
            viewModel.tapFBLogin()
            return
        }
        
        let homeStory = UIStoryboard(name: "Home", bundle: nil)
        if let homeVC = homeStory.instantiateViewController(withIdentifier: "SurveyViewController") as? SurveyViewController {
            
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
        
    }
}


