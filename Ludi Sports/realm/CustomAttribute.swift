//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class CustomAttribute: Object, Codable {
    @objc dynamic var key: String? = ""
    @objc dynamic var value: String? = nil

    func add(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

//extension List where Element == CustomAttribute {
//    func toPlayerRef() -> PlayerRef {
//        let playerRef = PlayerRef()
//        forEach { attribute in
//            guard let key = attribute.key, let value = attribute.value else { return }
//            playerRef.updateAttribute(key: key, value: value)
//        }
//        return playerRef
//    }
//}

extension PlayerRef {
    func toCustomAttributesList() -> List<CustomAttribute> {
        let customAttributes = List<CustomAttribute>()
        // Set customAttributes using self properties
        // Example: customAttributes.addAttribute(key: "id", value: self.id ?? "0")
        // Use the addAttribute method to add key-value pairs
        return customAttributes
    }
}
