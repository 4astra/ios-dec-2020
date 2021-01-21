//
//  Ext.swift
//  Tiny App
//
//  Created by Hockey on 1/11/21.
//

import UIKit

extension UIViewController {
    @available(iOS 13.0, *)
    var sceneDelegate: SceneDelegate? {
        guard let windowScence = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScence.delegate as? SceneDelegate else {
            return nil
        }
        return delegate
    }
    
    var appDelegate: AppDelegate? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return delegate
    }
}

extension UIStoryboard {
    static func instanceWith(name: String) -> UIStoryboard? {
        var story: UIStoryboard?
        do {
            story = try? UIStoryboard(name: name, bundle: nil)
        } catch {
            print("Error")
        }
        return story
    }
}
