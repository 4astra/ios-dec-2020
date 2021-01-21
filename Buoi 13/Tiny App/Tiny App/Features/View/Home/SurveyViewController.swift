//
//  SurveyViewController.swift
//  Tiny App
//
//  Created by Hockey on 12/28/20.
//

import UIKit

class SurveyViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Khai báo outlet đến UITableview
    @IBOutlet weak var ibSurveyTable: UITableView!
    // Khai báo mảng Single Option và khởi tạo
    var survey = [SingleOption]()
    
    
    @objc func listenBroadcast(notify: Notification) {
        if let data = notify.userInfo as? [String: Int], data["value"] == 1 {
//            print("\(data)")
            showMessage(message: "xin chao")
        }
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(MemCache.shared.data ?? "nil")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(listenBroadcast(notify:)), name: NSNotification.Name.xinChao, object: nil)
        // Đăng ký tệp Nib SingleOptionCell cell: cho Table tên ibSurveyTable
        ibSurveyTable.register(UINib(nibName: "SingleOptionCell", bundle: nil), forCellReuseIdentifier: "SingleOptionCell")
        
        // Dummy dữ liệu giả
        for i in 0..<100 {
            let item = SingleOption()
            item.title = "Q\(i): Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            survey.append(item)
        }
        
        
        // Khai báo nút Next nằm trên cùng bên phải của NavigationBar
        // Thêm sự kiện: #selector(goNextScreen) đi đến màn hình
        // SurveyResultViewCtr
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Next",
            style: .plain,
            target: self,
            action: #selector(goNextScreen)
        )
        
        // Do any additional setup after loading the view.
    }
    
    @objc func goNextScreen() {
        
//        showMessage(message: "hello World")
//        return
        // lấy các item đã chọn
        var selecteds = [SingleOption]()
        for i in 0..<survey.count {
            if survey[i].isSelected {
                selecteds.append(survey[i])
            }
        }
        // Khai báo một biến có kiểu UIStoryboard và lấy ra instance của tệp Home.storyboard
        let homeStory = UIStoryboard(name: "Home", bundle: nil)
        
        // Lấy ra instance của SurveyResultViewCtr thông qua
        // một định danh có tên trùng với tên class SurveyResultViewCtr
        guard let surveyAnswerCtr = homeStory.instantiateViewController(withIdentifier: "SurveyResultViewCtr") as? SurveyResultViewCtr else {
            return
            // Return: Chấm dứt tại đây nếu không lấy đc định danh SurveyResultViewCtr(. Giá trị surveyAnswerCtr lúc này == nil)
        }
        //Gán answer bằng giá trị lọc: selecteds ở trên
        surveyAnswerCtr.answer = selecteds
        
        // Gọi navigationController đẩy tới một viewcontroller
        navigationController?.pushViewController(surveyAnswerCtr, animated: true)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Trả về số lượng Phần(sections)
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Trả về tổng số dòng sẽ có
        // Do chúng ta chỉ có 1 section nên mặc định.
        // .Nên chúng ta trả về tổng số dòng của section = 0
        return survey.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Xử lý Logic cho multiple lựa chọn khi click vào từng cell
        for i in 0..<survey.count {
            if indexPath.row == i {
                survey[indexPath.row].isSelected = !survey[indexPath.row].isSelected
            }
        }
        // Gọi hành động loát lại dữ liệu sau khi trạng thái
        // của [survey] đã thay đổi
        ibSurveyTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Mô tả Cell nào sẽ được hiển thị ra màn hình
        // bằng cách dequeue Tái sử dụng Cell đã đăng
        // ký ở trên
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SingleOptionCell", for: indexPath) as? SingleOptionCell else {
            
            // Nếu không dequeue đc thì trả về một cell mặc định
            return UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "")
        }
        cell.ibTitle.text = survey[indexPath.row].title
        cell.ibSelectBtn.isSelected = survey[indexPath.row].isSelected
        // Tai Cell can luu tru lai IndexPath
        cell.indexPath = indexPath
        // Cach 1: Su Dung Protocol
        //        cell.delegate = self
        
        // Cach 2: Su dung closure lam callback
        
//        cell.callBack = { [weak self] (idxPath) in
//            guard let strongSelf = self else {
//                return
//            }
//            for i in 0..<strongSelf.survey.count {
//                if idxPath.row == i {
//                    strongSelf.survey[idxPath.row].isSelected = !strongSelf.survey[idxPath.row].isSelected
//                }
//            }
//            // Gọi hành động loát lại dữ liệu sau khi trạng thái
//            // của [survey] đã thay đổi
//            strongSelf.ibSurveyTable.reloadData()
//    }
        
        
        // Cach 3: Them customize su kien cho
        // button va luu tru indexPath
        let buttonTap = ButtonTap(target: self, action: #selector(clickOnCell(sender:)))
        buttonTap.indexPath = indexPath
        cell.ibSelectBtn.addGestureRecognizer(buttonTap)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Gán độ cao mặc định của 1 cell
        return 110
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.xinChao, object: nil)
        	
    }
    
}

extension SurveyViewController: SingleOptionCellDelegate {
    
    func willClickAt(indexPath: IndexPath) {
        for i in 0..<survey.count {
            if indexPath.row == i {
                survey[indexPath.row].isSelected = !survey[indexPath.row].isSelected
            }
        }
        // Gọi hành động loát lại dữ liệu sau khi trạng thái
        // của [survey] đã thay đổi
        ibSurveyTable.reloadData()
    }
    
}

// MARK: - ABCBB
extension SurveyViewController {
    @objc func clickOnCell(sender: Any)  {
    
        guard let btn = sender as? ButtonTap else {
            return
        }
        for i in 0..<survey.count {
            // Radio Case
//            if btn.indexPath.row == i {
//                survey[btn.indexPath.row].isSelected = true
//
//            }
//            else {
//                survey[i].isSelected = false
//            }
            
      // Multiple case
            if( btn.indexPath.row == i) {
                survey[btn.indexPath.row].isSelected = !survey[btn.indexPath.row].isSelected
            }
        }
        // Gọi hành động loát lại dữ liệu sau khi trạng thái
        // của [survey] đã thay đổi
        ibSurveyTable.reloadData()
    }
}

