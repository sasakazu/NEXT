//
//  object.swift
//  NEXT
//
//  Created by 笹倉一也 on 2019/05/12.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import Foundation
import RealmSwift

class Next: Object {

    @objc dynamic var id : Int = 0
    @objc dynamic var name = ""
    let items = List<Item>()
    
    
    
    func save() {
        let realm = try! Realm()
        if realm.isInWriteTransaction {
            if self.id == 0 { self.id = self.createNewId() }
            realm.add(self, update: true)
        } else {
            try! realm.write {
                if self.id == 0 { self.id = self.createNewId() }
                realm.add(self, update: true)
            }
        }
    }
    
    //     新しいIDを採番します。
    private func createNewId() -> Int {
        let realm = try! Realm()
        return (realm.objects(type(of: self).self).sorted(byKeyPath: "id", ascending: false).first?.id ?? 0) + 1
    }
    
    // プライマリーキーの設定
    override static func primaryKey() -> String? {
        return "id"
    }


}


class Item: Object {
    
    
    @objc dynamic var name = ""
    
    
}
