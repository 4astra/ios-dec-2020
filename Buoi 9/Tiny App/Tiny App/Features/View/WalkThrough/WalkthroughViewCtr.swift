//
//  WalkthroughViewCtr.swift
//  Tiny App
//
//  Created by Hockey on 1/14/21.
//

import UIKit


class WalkthroughViewCtr: UIViewController {
    
    @IBOutlet weak var ibPageControl: UIPageControl!
    
    var myPageViewCtr: MyPageViewCtr!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ẩn navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
    @IBAction func doLogin(_ sender: Any) {
        
        if let authBoard = UIStoryboard.instanceWith(name: "Authen"), let loginViewCtr = authBoard.instantiateViewController(identifier: "LoginViewController") as? LoginViewController {
            
            // xóa key login FB để màn hình login có thể xuất hiện
            UserDefaults.standard.removeObject(forKey: "loginFB")
            
            // Trình bày màn hình LoginViewCtr
            navigationController?.present(loginViewCtr, animated: true, completion: nil)
        }
    }
    
    @IBAction func goToPage3(_ sender: Any) {
        myPageViewCtr.scrollToPageIndex(index: 2)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tempsPageViewCtr = segue.destination as? MyPageViewCtr {
            myPageViewCtr = tempsPageViewCtr
            
            // Xet delegate de nhan thong bao khi cuon TRANG
            myPageViewCtr.myDelegate = self
            
            // Khai bao cac trang con VC cua no
            let storyBoard = UIStoryboard(name: "Walkthrough", bundle: nil)
            let v1 = storyBoard.instantiateViewController(identifier: "v1")
            let v2 = storyBoard.instantiateViewController(identifier: "v2")
            let v3 = storyBoard.instantiateViewController(identifier: "v3")
            // Khoi tao danh sach cac trang cho Page VC
            let arrayPages = [v1, v2, v3]
            myPageViewCtr.setUpPages(pages: arrayPages)
            // Khai bao Uy quyen page Data source cho myPageViewCtr
            myPageViewCtr.setDatasourceDelegate()
            // So luong trang cho Page Control
            ibPageControl.numberOfPages = arrayPages.count
        }
    }
    

}

extension WalkthroughViewCtr: NotifyPageDelegate {
    func haveWalkedToPageIndex(index: Int) {
        ibPageControl.currentPage = index
    }
}
