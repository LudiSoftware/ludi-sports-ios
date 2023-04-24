//
//  RealmInstance.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class RealmInstance {
    static let instance: Realm = {
        return try! Realm()
    }()
}

func realm() -> Realm {
    return RealmInstance.instance
}

// Using a closure as a shortcut for realm().write
func safeWrite(_ block: @escaping (Realm) -> Void) {
    let realmInstance = realm()
    if realmInstance.isInWriteTransaction {
        DispatchQueue.main.async {
            try? realmInstance.write {
                block(realmInstance)
            }
        }
    } else {
        try? realmInstance.write {
            block(realmInstance)
        }
    }
}
