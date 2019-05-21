//
//  nextAdd.swift
//  NEXT
//
//  Created by 笹倉一也 on 2019/05/12.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class nextAdd: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var projectNameTF: UITextField!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        projectNameTF.delegate = self
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    }
    
    @IBAction func doneBtn(_ sender: Any) {
        
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as? toDoList
        let _ = next?.view
        
        next?.reciveProject = projectNameTF.text!
    }
  
    


}
