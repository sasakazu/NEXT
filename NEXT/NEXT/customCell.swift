//
//  customCell.swift
//  NEXT
//
//  Created by 笹倉一也 on 2019/05/22.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {
    
    @IBOutlet weak var swichBtn: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
