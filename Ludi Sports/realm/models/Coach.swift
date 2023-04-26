//
//  Coach.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class Coach: Object {
    static let orderByOrganization = "organizationId"

    @objc dynamic var id: String = "unassigned"
    @objc dynamic var userId: String? = "unassigned"
    @objc dynamic var name: String = "unassigned"
    @objc dynamic var title: String? = nil
    var organizationIds = List<String>()
    var teams = List<String>()
    @objc dynamic var hasReview: Bool = false
    var reviewIds = List<String>()
    // base (12)
    @objc dynamic var dateCreated: String? = getTimeStamp()
    @objc dynamic var dateUpdated: String? = getTimeStamp()
    @objc dynamic var firstName: String? = "null"
    @objc dynamic var lastName: String? = "null"
    @objc dynamic var type: String? = "null"
    @objc dynamic var subType: String? = "null"
    @objc dynamic var details: String? = "null"
    @objc dynamic var isFree: Bool = true
    @objc dynamic var status: String? = "null"
    @objc dynamic var mode: String? = "null"
    @objc dynamic var imgUrl: String? = "null"
    @objc dynamic var sport: String? = "null"

    override class func primaryKey() -> String? {
        return "id"
    }
}

