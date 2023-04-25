//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift


class Roster: Object {
    @objc dynamic var id: String? = UUID().uuidString
    @objc dynamic var organizationId: String? = "unassigned"
    @objc dynamic var teamId: String? = "unassigned"
    @objc dynamic var coachId: String? = "unassigned"
    @objc dynamic var name: String? = "unassigned"
    @objc dynamic var season: String? = "unassigned"
    @objc dynamic var year: String? = "unassigned"
    @objc dynamic var gender: String? = "unassigned"
    @objc dynamic var isLocked: Bool = false
    @objc dynamic var status: String? = "open"
    @objc dynamic var sport: String? = "unassigned"
    var players = List<PlayerRef>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
