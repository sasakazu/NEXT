//
//  addItem.swift
//  NEXT
//
//  Created by 笹倉一也 on 2019/05/24.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class addItem: UIViewController {
    
    var reciveItem:String = ""
    
    @IBOutlet weak var addTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func addItem(_ sender: Any) {
        
        do {
            let realm = try Realm()
            
            let person = realm.objects(Next.self).filter("name == %@", reciveItem)
            
            let nextName = person.first
            
            let someitems = Item()
            
            someitems.name = addTF.text!
            
            try! realm.write {
                nextName!.items.append(someitems)
                print("追加後person.cats: \(nextName!.items)")
            }
        } catch {
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    


}
