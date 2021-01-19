//
//  BaseViewController.swift
//  Tiny App
//
//  Created by Hockey on 1/4/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    func setImageForTabBar() {
//        if let items = tabBarController?.tabBar.items {
//
//            let selectedImgs: [UIImage] = [UIImage(named: "tab-0-sel")!, UIImage(named: "tab-1-sel")!, UIImage(named: "tab-2-sel")!]
//            let normalImgs: [UIImage] = [UIImage(named: "tab-0")!, UIImage(named: "tab-1")!, UIImage(named: "tab-2")!]
//
//            for i in 0..<items.count {
//                let tabBarItem = items[i]
//                tabBarItem.selectedImage = selectedImgs[i]
//                tabBarItem.image = normalImgs[i]
//            }
//        }
//    }
    
    func setImageForTabBar() {
        if let items = tabBarController?.tabBar.items {
            
            let selectedImgs: [UIImage] = [UIImage(named: "tab-0-sel")!, UIImage(named: "tab-1-sel")!, UIImage(named: "tab-2-sel")!]
            let normalImgs: [UIImage] = [UIImage(named: "tab-0")!, UIImage(named: "tab-1")!, UIImage(named: "tab-2")!]
            
            for i in 0..<items.count {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
