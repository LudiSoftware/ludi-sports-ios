//
//  ModeProvider.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import UIKit

enum TeamMode: String {
    case creation = "creation"
    case preSeason = "pre_season"
    case inSeason = "in_season"
    case offSeason = "off_season"
    case tryout = "tryout"
    case pendingRoster = "pending_roster"
    
    var color: UIColor {
        switch self {
        case .creation, .preSeason, .inSeason:
            return UIColor(named: "ludiRosterCardSelected") ?? UIColor.red
        case .offSeason:
            return UIColor(named: "ludiWhite") ?? UIColor.white
        case .tryout:
            return UIColor(named: "ludiRosterCardRed") ?? UIColor.red
        case .pendingRoster:
            return UIColor(named: "ludiRosterCardYellow") ?? UIColor.yellow
        }
    }
    
    var title: String {
        switch self {
        case .creation:
            return "Team Creation"
        case .preSeason:
            return "Pre-Season"
        case .inSeason:
            return "In-Season"
        case .offSeason:
            return "Off-Season"
        case .tryout:
            return "Tryout"
        case .pendingRoster:
            return "Pending Roster"
        }
    }
    
    static func parse(mode: String?) -> TeamMode {
        return TeamMode(rawValue: mode ?? "") ?? .creation
    }
}

enum TryoutMode: String {
    case registration = "registration"
    case tryout = "tryout"
    case pendingRoster = "pending_roster"
    case complete = "complete"
}

enum RosterMode: String {
    case registration = "registration"
    case tryout = "tryout"
    case pendingRoster = "pending_roster"
    case complete = "complete"
}

enum PlayerMode: String {
    case pendingRegistration = "pending_registration"
    case registered = "registered"
    case pendingApproval = "pending_approval"
    case approved = "approved"
    case rejected = "rejected"
}
