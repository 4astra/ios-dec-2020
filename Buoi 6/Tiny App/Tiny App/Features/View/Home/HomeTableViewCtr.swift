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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.isNone() ? 0 : self.viewModel!.filmsArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        var cell: UITableViewCell
        if row % 2  == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell", for: indexPath)
            if let homeCell = cell as? HomeViewCell, let vm = viewModel {
                homeCell.ibTitle?.text = vm.filmsArr[indexPath.row].title
                homeCell.ibSubTitle?.text = vm.filmsArr[indexPath.row].producer
            }
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "OtherViewCell", for: indexPath)
            if let homeCell = cell as? OtherHomeCell, let vm = viewModel {
                homeCell.ibTitle?.text = vm.filmsArr[indexPath.row].title
                homeCell.ibSubTitle?.text = vm.filmsArr[indexPath.row].producer
            }
        }
        
        // Configure the cell...

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }

    
}
