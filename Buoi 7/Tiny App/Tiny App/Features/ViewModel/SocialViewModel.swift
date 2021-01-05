//
//  SocialViewModel.swift
//  Tiny App
//
//  Created by Hockey on 12/21/20.
//

import Foundation
import FBSDKLoginKit


class SocialViewModel {
    weak var viewControler: LoginViewController?
    var gotoHome:(() -> ())?
    
    init(viewController: LoginViewController) {
        self.viewControler = viewController
    }
    
    func tapFBLogin() {
        // 1
        let loginManager = LoginManager()
        
        if let _ = AccessToken.current {
            loginManager.logOut()
        }
        //. Force Login again
        // 2. Access token not available -- user already logged out
        // Perform log in
        
        // 3
        guard let vc = viewControler else {
            return
        }
        
        loginManager.logIn(permissions: [], from: vc) { [weak self] (result, error) in
            
            // 4
            // Check for error
            guard error == nil else {
                // Error occurred
                print(error!.localizedDescription)
                return
            }
            
            // 5
            // Check for cancel
            guard let result = result, !result.isCancelled else {
                print("User cancelled login")
                return
            }
            
            // Successfully logged in
            // 6
            if let token = AccessToken.current {
                print("FB token: \(token.tokenString)")
                print("\(result)")
                let userDefault = UserDefaults.standard
                userDefault.setValue("1", forKey: "loginFB")
                self?.gotoHome?()
            }
        }
    }
    
}
