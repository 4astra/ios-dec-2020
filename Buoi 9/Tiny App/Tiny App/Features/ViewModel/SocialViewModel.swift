//
//  SocialViewModel.swift
//  Tiny App
//
//  Created by Hockey on 12/21/20.
//

import Foundation
import FBSDKLoginKit
import JGProgressHUD

class SocialViewModel {
    let hud = JGProgressHUD()
    weak var viewControler: LoginViewController?
    var gotoHome:(() -> ())?
    // Dinh nghia 1 callback to MainTab
    var gotoMainTab:(() -> Void)?
    
    init(viewController: LoginViewController) {
        self.viewControler = viewController
    }
    
    func tapFBLogin() {
        //Show ProgressView
        
        if let view = viewControler?.view {
            hud.textLabel.text = "Loading"
            hud.show(in: view)
        }
        
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
                self?.hud.dismiss()
                return
            }
            
            // 5
            // Check for cancel
            guard let result = result, !result.isCancelled else {
                print("User cancelled login")
                
                self?.hud.dismiss()
                return
            }
            
            // Successfully logged in
            // 6
            if let token = AccessToken.current {
                print("FB token: \(token.tokenString)")
                //print("\(result)")
                let userDefault = UserDefaults.standard
                userDefault.setValue("1", forKey: "loggedIn")

                self?.hud.dismiss()
                
                self?.gotoMainTab?()
            }
        }
    }
    
}
