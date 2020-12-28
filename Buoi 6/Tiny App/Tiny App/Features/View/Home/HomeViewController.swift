//
//  HomeViewController.swift
//  Tiny App
//
//  Created by Hockey on 12/21/20.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var ibTableView: UITableView!
    var viewModel: HomeViewModel! {
        didSet {
            
            // Lắng nghe Callback khi reUpdateUI?() đc gọi từ HomeViewModel
            viewModel.reUpdateUI = {
                [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.ibTableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Đăng ký 2 Nib cell cho ibTableView - kèm
        // với tên định danh vô tình trùng với tên Class
        self.ibTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        ibTableView.register(UINib(nibName: "OtherTableViewCell", bundle: nil), forCellReuseIdentifier: "OtherTableViewCell")
        
        // Khởi tạo HomeViewModel
        viewModel = HomeViewModel()
        
        // Gọi lấy dữ liệu từ API
        viewModel.fetchAll()
    
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Table có 2 phần sections
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Chúng ta có thể kiểm tra 2 phần section có
        // số dòng khác nhau ở đây thông qua biến: section
        // Do ở đây mặc định cho mỗi phần section có cùng tổng
        // số dòng
        return self.viewModel == nil ? 0 : self.viewModel!.filmsArr.count
        // self.viewModel!.filmsArr.count: Tổng số phần tử của mảng
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "")
        
        // Phần thứ 1 có section == 0
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            if let homeCell = cell as? MyCell, let vm = viewModel {
                homeCell.ibTitle.text = vm.filmsArr[indexPath.row].title
                homeCell.ibSubTitle.text = vm.filmsArr[indexPath.row].producer
            }
        }
        else {
            // Phần thứ 1 có section == 1.
            // Ứng với mỗi phần các bạn có thể dequeue
            // Tái Sử Dụng Cell theo ý mình
            cell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell", for: indexPath)
            if let homeCell = cell as? OtherTableViewCell, let vm = viewModel {
                homeCell.ibTitle.text = vm.filmsArr[indexPath.row].title
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}
