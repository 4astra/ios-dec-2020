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
        self.ibTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        ibTableView.register(UINib(nibName: "OtherTableViewCell", bundle: nil), forCellReuseIdentifier: "OtherTableViewCell")
        
        viewModel = HomeViewModel()
        
        viewModel.fetchAll()
    
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel == nil ? 0 : self.viewModel!.filmsArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "")
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            if let homeCell = cell as? MyCell, let vm = viewModel {
                homeCell.ibTitle.text = vm.filmsArr[indexPath.row].title
                homeCell.ibSubTitle.text = vm.filmsArr[indexPath.row].producer
            }
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "OtherTableViewCell", for: indexPath)
            if let homeCell = cell as? OtherTableViewCell, let vm = viewModel {
                homeCell.ibTitle.text = vm.filmsArr[indexPath.row].title
            }
        }
        
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        // Do any additional setup after loading the view.
    //    }
    //
    //    @IBAction func doUpdate(_ sender: Any) {
    //        if let uploadUrl = Bundle.main.url(forResource: "2020-11-12", withExtension: "png") {
    //            let rawUploadData = try? Data.init(contentsOf: uploadUrl)
    //            guard let newData = rawUploadData else {
    //                return
    //            }
    //            AF.upload(multipartFormData: { multipart in
    //                multipart.append(newData, withName: "1", fileName: "2020-11-12.png", mimeType: "image/png")
    //            }, to: "http://192.168.28.82:8080/api/v1/file/photos")
    //            .response {
    //                response in
    //                print("\(response)")
    //            }
    //        }
    //    }
    
    
}
