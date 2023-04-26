//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class Note: Object, Codable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var ownerId: String? = "null"
    @objc dynamic var ownerName: String? = "null"
    @objc dynamic var coachId: String? = "null"
    @objc dynamic var doubleId: String? = "null"
    @objc dynamic var dateCreated: String = getTimeStamp()
    @objc dynamic var dateUpdated: String = getTimeStamp()
    @objc dynamic var aboutTeamId: String? = "null"
    @objc dynamic var aboutPlayerId: String? = "null"
    @objc dynamic var aboutCoachId: String? = "null"
    @objc dynamic var sport: String? = "null"
    @objc dynamic var type: String? = "null"
    @objc dynamic var subtype: String? = "null"
    @objc dynamic var message: String? = "null"

    override static func primaryKey() -> String? {
        return "id"
    }
}



enum NoteTypes: String {
    case player = "player"
    case team = "team"
    case tryout = "tryout"
    case game = "game"
    case practice = "practice"
    case privateCase = "private"
    case event = "event"
    case organization = "organization"
    case coach = "coach"
    case parent = "parent"
}

