//
//  Coach.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class Player: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var userId: String? = "unassigned"
    @objc dynamic var team: String? = ""
    @objc dynamic var rank: Int = 0
    @objc dynamic var number: Int = 0
    @objc dynamic var tryoutTag: String? = "unassigned"
    var notes = List<String>()
    @objc dynamic var age: Int = 0
    @objc dynamic var dob: String? = "unassigned"
    @objc dynamic var position: String? = "unassigned"
    @objc dynamic var foot: String? = "unassigned"
    var contacts = List<String>()
    //Extras
    @objc dynamic var playerName: String? = "unassigned"
    @objc dynamic var teamName: String? = "unassigned"
    var organizations = List<String>()
    var teams = List<String>()
    @objc dynamic var hasReview: Bool = false
    var reviewIds = List<String>()
    // base
    @objc dynamic var dateCreated: String? = getTimeStamp()
    @objc dynamic var dateUpdated: String? = getTimeStamp()
    @objc dynamic var name: String? = "unassigned"
    @objc dynamic var firstName: String? = "unassigned"
    @objc dynamic var lastName: String? = "unassigned"
    @objc dynamic var type: String? = "unassigned"
    @objc dynamic var subType: String? = "unassigned"
    @objc dynamic var details: String? = "unassigned"
    @objc dynamic var isFree: Bool = false
    @objc dynamic var status: String? = "unassigned"
    @objc dynamic var mode: String? = "unassigned"
    @objc dynamic var imgUrl: String? = "unassigned"
    @objc dynamic var sport: String? = "unassigned"

    override class func primaryKey() -> String? {
        return "id"
    }
}

