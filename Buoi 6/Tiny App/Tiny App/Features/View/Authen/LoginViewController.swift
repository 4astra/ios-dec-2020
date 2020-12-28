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
    }
    
    @IBAction func loginWithFB(_ sender: Any) {
        viewModel.tapFBLogin()
    }
    
}
