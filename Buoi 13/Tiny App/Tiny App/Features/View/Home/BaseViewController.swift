//
//  BaseViewController.swift
//  Tiny App
//
//  Created by Hockey on 1/4/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        setImageForTabBar()
        super.viewDidLoad()
    }
    
    func setImageForTabBar() {
        guard let count = tabBarController?.tabBar.items?.count, count > 0 else {
            return
        }
        var selectedImgs = [UIImage]()
        var normalImgs = [UIImage]()
        
        for i in 0 ..< count {
            let selectedImageName = "tab-\(i)-sel"
            let normalImageName = "tab-\(i)"
            if let selImage = UIImage(named: selectedImageName) {
                selectedImgs.append(selImage)
            } else {
                selectedImgs.append(UIImage())
            }
            
            if let norImage = UIImage(named: normalImageName) {
                normalImgs.append(norImage)
            } else {
                normalImgs.append(UIImage())
            }
        }
        
        if let items = tabBarController?.tabBar.items {
            
            for i in 0 ..< count {
                let tabBarItem = items[i]
                tabBarItem.selectedImage = selectedImgs[i]
                tabBarItem.image = normalImgs[i]
            }
        }
    }
    
    func showMessage(message: String){
        // Chung ta co the dinh nghia
        // alert kieu la Alert hoac ActionSheet
        //        let alertViewController = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        
        let alertViewController = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.actionSheet)
        let action1 = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            
        }
        let action2 = UIAlertAction(title: "Huy", style: UIAlertAction.Style.destructive) { (UIAlertAction) in
            self.dismiss(animated: true) {
                
            }
        }
        alertViewController.addAction(action1)
        alertViewController.addAction(action2)
        self.present(alertViewController, animated: true, completion: nil)
    }
}
