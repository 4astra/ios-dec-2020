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
            self.viewModel.gotoHome = { [weak self] in
                guard let strongSelf = self else {
                    return
                }

                let homeStory = UIStoryboard(name: "Home", bundle: nil)
                if let homeVC = homeStory.instantiateViewController(identifier: "SurveyViewController") as? SurveyViewController {
                    
                    strongSelf.navigationController?.pushViewController(homeVC, animated: true)
                }
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SocialViewModel(viewController: self)
        let library_path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
        
        let userDefault = UserDefaults.standard
        if let jet = userDefault.string(forKey: "loginFB"), jet == "1" {
            let homeStory = UIStoryboard(name: "Home", bundle: nil)
            if let homeVC = homeStory.instantiateViewController(identifier: "SurveyViewController") as? SurveyViewController {
                
                self.navigationController?.pushViewController(homeVC, animated: true)
            }
        }
        print("library path is \(library_path)")
    }
    
    @IBAction func loginWithFB(_ sender: Any) {
        let userDefault = UserDefaults.standard
        guard let _ = userDefault.string(forKey: "loginFB") else {
            viewModel.tapFBLogin()
            return
        }
        
        let homeStory = UIStoryboard(name: "Home", bundle: nil)
        if let homeVC = homeStory.instantiateViewController(identifier: "SurveyViewController") as? SurveyViewController {
            
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
        }
        
    }
    

