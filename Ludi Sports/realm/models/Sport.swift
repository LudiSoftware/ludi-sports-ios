//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class Sport: Object {
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var isVisible: Bool = true
    
    @objc dynamic var dateCreated: String? = getTimeStamp()
    @objc dynamic var dateUpdated: String? = getTimeStamp()
    @objc dynamic var name: String?
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var type: String?
    @objc dynamic var subType: String?
    @objc dynamic var details: String?
    @objc dynamic var isFree: Bool = false
    @objc dynamic var status: String?
    @objc dynamic var mode: String?
    @objc dynamic var imgUrl: String?
    @objc dynamic var sport: String?
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
