//
//  nextMain.swift
//  NEXT
//
//  Created by 笹倉一也 on 2019/05/12.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class nextMain: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nextItem: Results<Next>!
    var projectTitle:String = ""
    
    @IBOutlet weak var nextTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
        let realm = try! Realm()
        nextItem = realm.objects(Next.self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nextTableView.reloadData()
        
    }
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        
        return nextItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath)->UITableViewCell {
        
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        let object = nextItem[indexpath.row]
        
        cell.textLabel?.text = object.projectName
        
        return cell
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let object = nextItem[indexPath.row]
        
        projectTitle = object.projectName
        
        
        performSegue(withIdentifier: "nextDetail",sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "nextDetail") {
            
            let secondVC: nextDetail = (segue.destination as? nextDetail)!
            
            secondVC.pjName = projectTitle
        }
    }
    
    
    
    //    delete
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.nextItem[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
            }catch{
                
                
                self.nextTableView.reloadData()
            }
        }
    }
    
    
}
