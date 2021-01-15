//
//  Ext.swift
//  Tiny App
//
//  Created by Hockey on 1/11/21.
//

import UIKit

extension UIViewController {
    var sceneDelegate: SceneDelegate? {
        guard let windowScence = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScence.delegate as? SceneDelegate else {
            return nil
        }
        return delegate
    }
}
