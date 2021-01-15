//
//  SingleOptionCell.swift
//  Tiny App
//
//  Created by Hockey on 12/28/20.
//

import UIKit

// 1. Dinh nghia 1 protocol cho cell nay

protocol SingleOptionCellDelegate {
    func willClickAt(indexPath: IndexPath)
}

class SingleOptionCell: UITableViewCell {
    // Luu dong IndexPath thu i
    var indexPath: IndexPath!
    @IBOutlet weak var ibTitle: UILabel!
    @IBOutlet weak var ibSelectBtn: UIButton!
    // 2. Khai bao 1 bien delegate co kieu SingleOptionCellDelegate. Để khai bao uỷ quyền
    var delegate: SingleOptionCellDelegate?
    
    
    // C2: su dung closure de call back lai
    
    var callBack:((IndexPath)-> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Them 1 cai action touch up inside
        ibSelectBtn.addTarget(self, action: #selector(doClickOnButton), for: UIControl.Event.touchUpInside)
    }
    
    @objc func doClickOnButton() {
//        delegate?.willClickAt(indexPath: indexPath)
        callBack?(indexPath)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
