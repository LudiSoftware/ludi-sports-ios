//
//  TeamSession.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class RosterSession: Object, Codable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var dateCreated: String = getTimeStamp()
    @objc dynamic var teamId: String? = "null"
    @objc dynamic var rosterId: String? = "null"
    @objc dynamic var tryoutRosterId: String? = "null"
    @objc dynamic var isTryout: Bool = false
    @objc dynamic var rosterSizeLimit: Int = 20
    @objc dynamic var playersSelectedCount: Int = 0
    var playerIds = List<String>()
    //formation
    @objc dynamic var teamColorsAreOn: Bool = true
    @objc dynamic var currentLayout: Int = 0
    var layoutList = List<Int>()
    var formationListIds = List<String>()
    var deckListIds = List<String>()
    // Layout
    @objc dynamic var layout: Int = 0 // Update this with the corresponding Swift value
    @objc dynamic var type: String = "players" // Update this with the corresponding Swift value
    @objc dynamic var size: String = "medium_grid"
    @objc dynamic var mode: String = "official"
    @objc dynamic var isOpen: Bool = true
    // Click Listeners
    @objc dynamic var touchEnabled: Bool = true
}

// Realm extension functions
extension Realm {
    func rosterSessionById(rosterId: String?, block: (RosterSession) -> Void) {
        if let rosterId = rosterId, let rosterSession = objects(RosterSession.self).filter("id == %@", rosterId).first {
            block(rosterSession)
        }
    }
    
    func rosterSessionById(rosterId: String?) -> RosterSession? {
        if let rosterId = rosterId {
            return objects(RosterSession.self).filter("id == %@", rosterId).first
        }
        return nil
    }
    
    func rosterSessionSizeLimit(rosterId: String?, default: Int = 20) -> Int {
        if let rosterId = rosterId, let result = objects(RosterSession.self).filter("id == %@", rosterId).first {
            return result.rosterSizeLimit
        }
        return `default`
    }
    
    func updateRosterSizeLimit(rosterId: String?, newSizeLimit: Int) {
        rosterSessionById(rosterId: rosterId) { rosterSession in
            do {
                try write {
                    rosterSession.rosterSizeLimit = newSizeLimit
                }
            } catch {
                print("Error updating roster size limit: \(error)")
            }
        }
    }
    
    func setupRosterSession(rosterId: String) {
        if object(ofType: RosterSession.self, forPrimaryKey: rosterId) == nil {
            do {
                try write {
                    let newRosterSession = RosterSession()
                    newRosterSession.id = rosterId
                    newRosterSession.currentLayout = 0 // Update this with the corresponding Swift value
                    newRosterSession.layoutList.append(0) // Update this with the corresponding Swift value
                    if let roster = findRosterById(rosterId: rosterId) {
                        newRosterSession.teamId = roster.teamId
                        for player in roster.players {
                            newRosterSession.playerIds.append(player.id ?? "")
                            newRosterSession.deckListIds.append(player.id ?? "")
                        }
                    }
                    add(newRosterSession, update: .modified)
                }
            } catch {
                print("Error setting up RosterSession: \(error)")
            }
        }
    }
    
    // Implement the setupRosterSession and other missing functions in Swift
    
    
}

