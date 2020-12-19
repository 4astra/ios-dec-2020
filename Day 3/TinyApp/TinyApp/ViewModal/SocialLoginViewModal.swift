//
//  SocialLoginViewModal.swift
//  TinyApp
//
//  Created by Hockey on 12/17/20.
//

import Foundation
import FBSDKLoginKit

class SocialLoginViewModal {
    weak var viewControler: ViewController?
    
    init(viewController: ViewController) {
        self.viewControler = viewController
    }
    
    func tapFBLogin() {
        // 1
        let loginManager = LoginManager()
        
        if let _ = AccessToken.current {
            loginManager.logOut()
        } else {
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
            }
        }
    }
}
