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
    
    var projectName: Results<Next>!
    var Name:String = ""
    
    @IBOutlet weak var nextTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        
        projectName = realm.objects(Next.self).sorted(byKeyPath: "id", ascending: true)
        
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return projectName.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath)->UITableViewCell {
        
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        let object = projectName[indexpath.row]
        
        
        cell.textLabel?.text = object.name
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let object = projectName[indexPath.row]
        
        Name = object.name
        
        performSegue(withIdentifier: "go",sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "go") {
            
            
            let secondVC: nextDetail = (segue.destination as? nextDetail)!
            
            secondVC.reciveName = Name
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.projectName[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)
                
                
            }catch{
                
                
                
                self.nextTableView.reloadData()
                
            }
        }
    }
    
    
    
    
    
}
