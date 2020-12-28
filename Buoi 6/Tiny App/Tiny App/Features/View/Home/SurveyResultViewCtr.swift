//
//  SurveyResultViewCtr.swift
//  Tiny App
//
//  Created by Hockey on 12/28/20.
//

import UIKit

class SurveyResultViewCtr: UIViewController {
    var answer: [SingleOption]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\(answer)")
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
