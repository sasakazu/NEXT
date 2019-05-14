//
//  nextDetail.swift
//  NEXT
//
//  Created by 笹倉一也 on 2019/05/12.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class nextDetail: UIViewController {
    
    
    var pjName:String = ""
    
    @IBOutlet weak var projectName: UILabel!
    
    @IBOutlet weak var nextDetailTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        projectName.text = pjName

    }
    


}
