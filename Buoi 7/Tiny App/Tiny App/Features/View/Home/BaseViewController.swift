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

        // Do any additional setup after loading the view.
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
