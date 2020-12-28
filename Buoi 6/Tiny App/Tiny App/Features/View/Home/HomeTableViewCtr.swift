//
//  HomeTableViewCtr.swift
//  Tiny App
//
//  Created by Hockey on 12/23/20.
//

import UIKit

extension Optional {
    func isNone() -> Bool {
        guard let _ = self else {
            return true
        }
        return false
    }
}

class HomeTableViewCtr: UITableViewController {
    var viewModel: HomeViewModel! {
        didSet {
            viewModel.reUpdateUI = {
                [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HomeViewModel()
        viewModel.fetchAll()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Table hiện tại có 1 phần (section)
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Số lượng dòng trong 1 section
        return self.viewModel.isNone() ? 0 : self.viewModel!.filmsArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // dequeue và Tái sử dụng Cell với tên là HomeViewCell
        // để hiển thị cell này ra màn hình
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell", for: indexPath)
        if let homeCell = cell as? HomeViewCell, let vm = viewModel {
            // Gán dữ liệu vào các outlets
            homeCell.ibTitle?.text = vm.filmsArr[indexPath.row].title
            homeCell.ibSubTitle?.text = vm.filmsArr[indexPath.row].producer
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Tự động mô tả độ cao của cell
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // Đánh giá ước lượng độ cao tạm thời.
        return 115
    }

    
}
