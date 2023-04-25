//
//  Coach.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class Parent: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var userId: String? = "unassigned"
    @objc dynamic var hasPlayer: Bool = false
    var players = List<String>()
    @objc dynamic var team: Bool = false
    var teams = List<String>()
    var organizations = List<String>()
    // base
    @objc dynamic var dateCreated: String? = getTimeStamp()
    @objc dynamic var dateUpdated: String? = getTimeStamp()
    @objc dynamic var name: String? = nil
    @objc dynamic var firstName: String? = nil
    @objc dynamic var lastName: String? = nil
    @objc dynamic var type: String? = nil
    @objc dynamic var subType: String? = nil
    @objc dynamic var details: String? = nil
    @objc dynamic var isFree: Bool = false
    @objc dynamic var status: String? = nil
    @objc dynamic var mode: String? = nil
    @objc dynamic var imgUrl: String? = nil
    @objc dynamic var sport: String? = nil

    override class func primaryKey() -> String? {
        return "id"
    }
}

