//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//
import Foundation
import RealmSwift

let PLAYER_STATUS_OPEN = "open"
let PLAYER_STATUS_CLOSED = "closed"
let PLAYER_STATUS_SELECTED = "selected"
let PLAYER_STATUS_OFFERED = "offered"
let PLAYER_STATUS_PENDING = "pending"
let PLAYER_STATUS_ACCEPTED = "accepted"
let PLAYER_STATUS_REJECTED = "rejected"

class PlayerRef: Object {
    
    @objc dynamic var id: String? = UUID().uuidString
    @objc dynamic var playerId: String? = UUID().uuidString
    @objc dynamic var name: String? = "unassigned"
    @objc dynamic var rank: Int = 0
    @objc dynamic var number: Int = 0
    @objc dynamic var tryoutTag: String? = "unassigned"
    @objc dynamic var position: String? = "unassigned"
    @objc dynamic var foot: String? = "unassigned"
    @objc dynamic var dob: String? = "unassigned"
    @objc dynamic var imgUrl: String? = "unassigned"
    @objc dynamic var pointX: Int = 0
    @objc dynamic var pointY: Int = 0
    @objc dynamic var color: String? = "unassigned"
    @objc dynamic var listPosition: Int = 0
    @objc dynamic var status: String? = "unassigned"
    @objc dynamic var userId: String? = "unassigned"
    @objc dynamic var parentId: String? = "unassigned"
    @objc dynamic var orderIndex: Int = 0
    // play metrics
    @objc dynamic var team: String? = "unassigned"
    @objc dynamic var season: String? = "unassigned"
    @objc dynamic var player_first_name: String? = "unassigned"
    @objc dynamic var player_last_name: String? = "unassigned"
    @objc dynamic var gender: String? = "unassigned"
    @objc dynamic var birth_date: String? = "unassigned"
    @objc dynamic var parent1_email: String? = "unassigned"
    @objc dynamic var parent1_first_name: String? = "unassigned"
    @objc dynamic var parent1_last_name: String? = "unassigned"
    @objc dynamic var parent1_mobile_number: String? = "unassigned"
    @objc dynamic var parent2_email: String? = "unassigned"
    @objc dynamic var parent2_first_name: String? = "unassigned"
    @objc dynamic var parent2_last_name: String? = "unassigned"
    @objc dynamic var parent2_mobile_number: String? = "unassigned"
    @objc dynamic var street: String? = "unassigned"
    @objc dynamic var city: String? = "unassigned"
    @objc dynamic var state: String? = "unassigned"
    @objc dynamic var zip: String? = "unassigned"

    override class func primaryKey() -> String? {
        return "id"
    }
}

