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
        // Khai báo nút Next nằm trên cùng bên phải của NavigationBar
        // Thêm sự kiện: #selector(goNextScreen) đi đến màn hình
        // SurveyResultViewCtr
        
        // Customize lai nut Back mac dinh
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Go back",
            style: .plain,
            target: self,
            action: #selector(comeback)
        )
    }
    
    @objc func comeback() {
//        NotificationCenter.default.post(name: Notification.Name.xinChao, object: self, userInfo: ["value": 1])
        
        // Chia se thong tin vao bien Data
        MemCache.shared.data = ["A": 123]
        self.navigationController?.popViewController(animated: true)
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

extension Notification.Name {
    static let xinChao = Notification.Name(rawValue: "XincChaoXXXKHXJHJ")
    
}
