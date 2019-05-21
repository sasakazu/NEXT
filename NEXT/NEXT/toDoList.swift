//
//  toDoList.swift
//  NEXT
//
//  Created by 笹倉一也 on 2019/05/21.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class toDoList: UIViewController {
    
    
    var reciveProject:String = ""
    
    
    
    @IBOutlet weak var todoListTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    
    @IBAction func saveBtn(_ sender: Any) {
        
        let person = Next()
        
        person.name = reciveProject
        
        person.save()
        
        do {
            let realm = try Realm()
            try! realm.write {
                realm.add(person) //モデルオブジェクトの追加
                print("1回目成功だよ", person)
            }
        } catch {
            print("エラーだよ")
        }
        
        
        let cat = Item()
        
        cat.name = todoListTF.text!
        
        /*
         1対多を追加
         */
        do {
            let realm = try Realm()
            try! realm.write {
                person.items.append(cat) //1対多の関連を追加
                
            }
        } catch {
        }
        
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    

}
