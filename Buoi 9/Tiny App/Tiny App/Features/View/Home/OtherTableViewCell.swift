//
//  OtherTableViewCell.swift
//  Tiny App
//
//  Created by Hockey on 12/28/20.
//

import UIKit

class OtherTableViewCell: UITableViewCell {
    //@IBOutlet weak var ibTitle: UILabel!
    @IBOutlet weak var ibDesc: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
