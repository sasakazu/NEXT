//
//  nextAdd.swift
//  NEXT
//
//  Created by 笹倉一也 on 2019/05/12.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class nextAdd: UIViewController {
    
    
    @IBOutlet weak var projectNameTF: UITextField!
    @IBOutlet weak var itemTF1: UITextField!
    @IBOutlet weak var itemTF2: UITextField!
    @IBOutlet weak var itemTF3: UITextField!
    @IBOutlet weak var itemTF4: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func doneBtn(_ sender: Any) {
        
        let newNext = Next()
        
        newNext.projectName = projectNameTF.text!
        newNext.nextItem1 = itemTF1.text!
        newNext.nextItem2 = itemTF2.text!
        newNext.nextItem3 = itemTF3.text!
        newNext.nextItem4 = itemTF4.text!
        
        do{
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(newNext)
                print("成功！！")
                
            })
        }catch{
            print("失敗！！！")
        }
        

        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func cancelBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    


}
