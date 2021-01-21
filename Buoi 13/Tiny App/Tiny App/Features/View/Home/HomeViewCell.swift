//
//  HomeViewCell.swift
//  Tiny App
//
//  Created by Hockey on 12/23/20.
//

import UIKit

class HomeViewCell: UITableViewCell {

    @IBOutlet weak var ibSubTitle: UILabel!
    @IBOutlet weak var ibTitle: UILabel!
    @IBOutlet weak var ibImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
