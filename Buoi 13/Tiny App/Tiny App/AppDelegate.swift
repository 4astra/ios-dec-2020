//
//  AppDelegate.swift
//  Tiny App
//
//  Created by Hockey on 12/18/20.
//

import UIKit
import FBSDKCoreKit
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ApplicationDelegate.shared.application(
                    application,
                    didFinishLaunchingWithOptions: launchOptions
                )
        IQKeyboardManager.shared.enable = true
        
        // Tuy chinh mau sac cua TabBar item
        let selectedColor = #colorLiteral(red: 0.9306194782, green: 0.5717230439, blue: 0.2236230969, alpha: 1)
        let normalColor = #colorLiteral(red: 0.7205738425, green: 0.7206764221, blue: 0.7205414176, alpha: 1)
        
        UITabBarItem.appearance().setTitleTextAttributes([
                                                            NSAttributedString.Key.foregroundColor : normalColor], for: UIControl.State.normal)
        UITabBarItem.appearance().setTitleTextAttributes([
                                                            NSAttributedString.Key.foregroundColor : selectedColor], for: UIControl.State.selected)
        UITabBar.appearance().tintColor = selectedColor
        
        if #available(iOS 13.0, *){
            //do nothing we will have a code in SceneceDelegate for this
        } else {
            let mainStoryboard = UIStoryboard(name: "Walkthrough", bundle: nil)
            
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window!.rootViewController = mainStoryboard.instantiateInitialViewController()
        }
        return true
        
    }

    
    func application(
            _ app: UIApplication,
            open url: URL,
            options: [UIApplication.OpenURLOptionsKey : Any] = [:]
        ) -> Bool {

            ApplicationDelegate.shared.application(
                app,
                open: url,
                sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                annotation: options[UIApplication.OpenURLOptionsKey.annotation]
            )

        }
    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

