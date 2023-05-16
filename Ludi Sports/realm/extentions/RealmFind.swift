//
//  RealmFind.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

extension Realm {
    func findByField<T: Object>(field: String = "id", value: String?) -> T? {
        guard let value = value else { return nil }
        return objects(T.self).filter("\(field) == %@", value).first
    }
    
    func findAllByField<T: Object>(field: String = "id", value: String?) -> Results<T>? {
        guard let value = value else { return nil }
        return objects(T.self).filter("\(field) == %@", value)
    }
}

// Coach Queries
extension Realm {
    func findCoachBySafeId() -> Coach? {
        var c: Coach? = nil
        self.safeUserId { userId in
            c = object(ofType: Coach.self, forPrimaryKey: userId)
        }
        return c
    }

}

// Team Queries
extension Realm {
    func findTeamById(teamId: String?) -> Team? {
        guard let id = teamId else { return nil }
        return object(ofType: Team.self, forPrimaryKey: id)
    }
}

// Player Queries
extension Realm {
    func findPlayerRefById(playerId: String?) -> PlayerRef? {
        guard let id = playerId else { return nil }
        return object(ofType: PlayerRef.self, forPrimaryKey: id)
    }
    
    func findPlayerRefById(playerId: String?, block: (PlayerRef?) -> Void) {
        let result = findPlayerRefById(playerId: playerId)
        block(result)
    }
}

// Roster Queries
extension Realm {
    func findRosterById(rosterId: String?) -> Roster? {
        guard let id = rosterId else { return nil }
        return object(ofType: Roster.self, forPrimaryKey: id)
    }
    
    func findRosterIdByTeamId(teamId: String?) -> String? {
        return findTeamById(teamId: teamId)?.rosterId
    }
    
    func findPlayersInRosterById(rosterId: String?) -> List<PlayerRef>? {
        return findRosterById(rosterId: rosterId)?.players
    }
}

// TryOut Queries
extension Realm {
    func findTryOutById(tryoutId: String?) -> TryOut? {
        guard let id = tryoutId else { return nil }
        return object(ofType: TryOut.self, forPrimaryKey: id)
    }
    
    func findTryOutIdByTeamId(teamId: String?) -> String? {
        return findTeamById(teamId: teamId)?.tryoutId
    }
    
    func findTryOutIdByTeamId(teamId: String?, block: (String) -> Void) {
        if let tryoutId = findTryOutIdByTeamId(teamId: teamId) {
            block(tryoutId)
        }
    }
    
    func findTryOutByTeamId(teamId: String?, block: (TryOut) -> Void) {
        if let tryoutId = findTryOutIdByTeamId(teamId: teamId),
           let tryout = findTryOutById(tryoutId: tryoutId) {
            block(tryout)
        }
    }
    func findAllSports() -> Results<Sport>? {
        return objects(Sport.self)
        
    }

    func findSportByName(name: String) -> Sport? {
        return self.objects(Sport.self).filter("name == %@", name).first
    }

}

