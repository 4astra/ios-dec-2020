//
//  HomeViewController.swift
//  Tiny App
//
//  Created by Hockey on 12/21/20.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doUpdate(_ sender: Any) {
        if let uploadUrl = Bundle.main.url(forResource: "2020-11-12", withExtension: "png") {
            let rawUploadData = try? Data.init(contentsOf: uploadUrl)
            guard let newData = rawUploadData else {
                return
            }
            AF.upload(multipartFormData: { multipart in
                multipart.append(newData, withName: "1", fileName: "2020-11-12.png", mimeType: "image/png")
            }, to: "http://192.168.28.82:8080/api/v1/file/photos")
            .response {
                response in
                print("\(response)")
            }
        }
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
