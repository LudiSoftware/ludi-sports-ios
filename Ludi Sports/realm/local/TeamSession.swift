//
//  TeamSession.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class TeamSession: Object, Codable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var dateCreated: String = getTimeStamp()
    @objc dynamic var teamId: String? = "null"
    @objc dynamic var rosterId: String? = "null"
    @objc dynamic var tryoutId: String? = "null"
    @objc dynamic var tryoutRosterId: String? = "null"
    @objc dynamic var rosterSizeLimit: Int = 20
    var playerIds = List<String>()
    //formation
    @objc dynamic var teamColorsAreOn: Bool = true
    @objc dynamic var currentLayout: Int = 0
    var layoutList = List<Int>()
    var formationListIds = List<String>()
    var deckListIds = List<String>()
}

extension Realm {
    func teamSessionByTeamId(teamId: String?, block: (TeamSession) -> Void) {
        if let teamId = teamId, let teamSession = objects(TeamSession.self).filter("teamId == %@", teamId).first {
            block(teamSession)
        }
    }
}

