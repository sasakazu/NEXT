//
//  nextDetail.swift
//  NEXT
//
//  Created by 笹倉一也 on 2019/05/12.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit
import RealmSwift

class nextDetail: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var reciveName:String = ""
    
//    var item:List<Item>!
    
    
    @IBOutlet weak var projectName: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        let realm = try! Realm()
        
        var users = realm.objects(Next.self).sorted(byKeyPath: "id", ascending: true)
        
        users = realm.objects(Next.self).filter("name == %@", reciveName)
        
        //        配列の最初だけをとる
        let u = users[0]
        let days = u.items
        
        
        print("現在表示しているのは\(u))")
        
        projectName.text = u.name
        
        for day in days {
            print("name: \(day.name)")
            
            print(day.name)
            
            print(u.items.count)
            
            
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableview.reloadData()
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let realm = try! Realm()
        
        var users = realm.objects(Next.self).sorted(byKeyPath: "id", ascending: true)
        
        users = realm.objects(Next.self).filter("name == %@", reciveName)
        
        
        let u = users[0]
        
        let it = u.items
        
        return it.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        
        let realm = try! Realm()
        
        var users = realm.objects(Next.self).sorted(byKeyPath: "id", ascending: true)
        
        users = realm.objects(Next.self).filter("name == %@", reciveName)
        
        //        配列の最初だけをとる
        let u = users[0]
        let days = u.items[indexPath.row]
        
        
        cell.textLabel?.text = days.name
        
        
        return cell
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {


        if(editingStyle == UITableViewCell.EditingStyle.delete) {
            do{
                let realm = try Realm()

                try realm.write {
                    
                    var users = realm.objects(Next.self).sorted(byKeyPath: "id", ascending: true)
                    
                    users = realm.objects(Next.self).filter("name == %@", reciveName)
                    
                    //        配列の最初だけをとる
                    let u = users[0]
                    let days = u.items
                    
                    
                    
                    
                    
                    realm.delete(u.items[indexPath.row])
                
                
                
                
                }
                
                
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.fade)


            }catch{



                self.tableview.reloadData()
                

            }
        }
    }
    
    
    }
    
    
