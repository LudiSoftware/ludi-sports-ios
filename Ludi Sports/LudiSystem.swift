//
//  LudiSystem.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation

struct YsrMode {
    static let viewOnly = "viewonly"
    static let basic = "basic"
    static let tryouts = "tryouts"
    static let season = "season"
}

struct AuthTypes: RawRepresentable {
    typealias RawValue = String

    static let master = AuthTypes(rawValue: "master")
    static let admin = AuthTypes(rawValue: "admin")
    static let orgAdminUser = AuthTypes(rawValue: "org_admin")
    static let coachUser = AuthTypes(rawValue: "coach")
    static let playerUser = AuthTypes(rawValue: "player")
    static let parentUser = AuthTypes(rawValue: "parent")
    static let basicUser = AuthTypes(rawValue: "basic")
    static let waiting = AuthTypes(rawValue: "waiting")
    static let unassigned = AuthTypes(rawValue: "unassigned")

    var rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
