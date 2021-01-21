//
//  MyCell.swift
//  Tiny App
//
//  Created by Hockey on 12/23/20.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet weak var ibTitle: UILabel!
    
    @IBOutlet weak var ibSubTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
