//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class Team: Object, Codable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var headCoachId: String? = "null"
    @objc dynamic var headCoachName: String? = "null"
    var coaches = List<String>()
    var managers = List<String>()
    var organizations = List<String>()
    @objc dynamic var rosterId: String? = "null"
    @objc dynamic var tryoutId: String? = "null"
    @objc dynamic var season: String? = "null"
    var locationIds: List<String>? = nil
    @objc dynamic var schedule: String? = nil
    @objc dynamic var year: String? = "null"
    @objc dynamic var ageGroup: String? = "null"
    @objc dynamic var isActive: Bool = false
    @objc dynamic var gender: String? = "null"
    @objc dynamic var hasReview: Bool = false
    
    // base
    @objc dynamic var dateCreated: String? = getTimeStamp()
    @objc dynamic var dateUpdated: String? = getTimeStamp()
    @objc dynamic var name: String? = "null"
    @objc dynamic var type: String? = "null"
    @objc dynamic var subType: String? = "null"
    @objc dynamic var details: String? = "null"
    @objc dynamic var isFree: Bool = false
    @objc dynamic var status: String? = TeamMode.tryout.rawValue
    @objc dynamic var mode: String? = TeamMode.tryout.rawValue
    @objc dynamic var imgUrl: String? = "null"
    @objc dynamic var sport: String? = "null"
    @objc dynamic var chatEnabled: Bool = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    

}
