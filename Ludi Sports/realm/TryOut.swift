//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class TryOut: Object {
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var isActive: Bool = false
    @objc dynamic var isFinalized: Bool = false
    @objc dynamic var teamId: String?
    @objc dynamic var headCoachId: String?
    @objc dynamic var headCoachName: String?
    @objc dynamic var locoationId: String?
    @objc dynamic var fieldNumber: String?
    let formUrls = List<String>()
    
    @objc dynamic var rosterId: String?
    
    let coachIds = List<String>()
    let managerIds = List<String>()
    let organizationIds = List<String>()
    
    @objc dynamic var year: String?
    @objc dynamic var ageGroup: String?
    @objc dynamic var gender: String?
    
    @objc dynamic var dateCreated: String? = getTimeStamp()
    @objc dynamic var dateUpdated: String? = getTimeStamp()
    @objc dynamic var name: String?
    @objc dynamic var type: String?
    @objc dynamic var subType: String?
    @objc dynamic var details: String?
    @objc dynamic var isFree: Bool = false
    @objc dynamic var status: String?
    @objc dynamic var mode: String = TryoutMode.registration.rawValue
    @objc dynamic var imgUrl: String?
    @objc dynamic var sport: String?
    @objc dynamic var chatEnabled: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
