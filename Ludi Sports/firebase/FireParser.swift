//
//  FireParser.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/25/23.
//
//
//  FireParser.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/25/23.
//

import Foundation
import FirebaseDatabase
import RealmSwift

// 1. Master Parsing Function Part 1 - From Firebase Object to Realm Object
extension DataSnapshot {
    func toLudiObject<T: Object>(_ type: T.Type, realm: Realm? = nil) -> T? {
        let hashmap = self.toHashMap()
        return hashmap.toRealmObject(type, realmParameter: realm)
    }

    // The Master List Of Firebase Objects Parser
    func toLudiObjects<T: Object>(_ type: T.Type, realm: Realm? = nil) -> List<T>? {
        let hashmap = self.toHashMap()
        let list = List<T>()
        for (_, value) in hashmap {
            if let tempHash = value as? [String: Any] {
                let temp: T? = tempHash.toRealmObject(type, realmParameter: realm)
                if let itTemp = temp {
                    list.append(itTemp)
                }
            }
        }
        return list.isEmpty ? nil : list
    }

    // Master toHashMap Helper Function
    func toHashMap() -> [String: Any] {
        var hashMap = [String: Any]()
        for child in children {
            let c = (child as? DataSnapshot)
            if let key = c?.key {
                hashMap[key] = c?.value
            }
        }
        return hashMap
    }
}

// Master Universal Realm Parser

extension Dictionary where Key == String, Value == Any {
    func toRealmObject<T: Object>(_ type: T.Type, realmParameter: Realm? = nil) -> T? {
            do {
                if let realm = realmParameter {
                    var object: T?
                    try? realm.write {
                        object = realm.create(type, value: self, update: .all)
                        realm.refresh()
                    }
                    return object
                } else {
                    let realm = realm()
                    var object: T?
                    try? realm.write {
                        object = realm.create(type, value: self, update: .all)
                        realm.refresh()
                    }
                    return object
                }
                
            }
        }
}
