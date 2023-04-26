//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class League: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String? = nil
    var organizationIds = List<String>()
    @objc dynamic var hasReview: Bool = false
//    @objc dynamic var reviews: ReviewBundle? = nil
    @objc dynamic var dateCreated: String? = nil
    @objc dynamic var dateUpdated: String? = nil
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

    override static func primaryKey() -> String? {
        return "id"
    }
}

