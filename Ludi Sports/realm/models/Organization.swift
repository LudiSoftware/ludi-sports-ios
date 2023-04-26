//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class Organization: Object {
    
    static let ORDER_BY_SPORTS = "sport"
    
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var officeHours: String?
    @objc dynamic var websiteUrl: String?
    
    @objc dynamic var estMemberCount: Int = 0
    @objc dynamic var estStaffCount: Int = 0
    @objc dynamic var estTeamCount: Int = 0
    
    let staff = List<String>()
    let coaches = List<String>()
    let leagues = List<String>()
    let teams = List<String>()
    let regions = List<String>()
    
    let locations = List<String>()
    
    let imgUris = List<String>()
    @objc dynamic var imgOrgIconUri: String?
    
    @objc dynamic var ratingScore: Int = 0
    @objc dynamic var ratingCount: Int = 0
    let reviews = List<String>()
    
    @objc dynamic var fromGoogle: Bool = false
    @objc dynamic var google_place_category: String?
    @objc dynamic var business_status: String?
    @objc dynamic var google_place_icon: String?
    @objc dynamic var google_place_rating: String?
    @objc dynamic var google_place_id: String?
    @objc dynamic var google_place_user_ratings_total: String?
    let tags = List<String>()
    
    @objc dynamic var dateCreated: String? = getTimeStamp()
    @objc dynamic var dateUpdated: String? = getTimeStamp()
    @objc dynamic var name: String?
    @objc dynamic var type: String?
    @objc dynamic var subType: String?
    @objc dynamic var details: String?
    @objc dynamic var isFree: Bool = false
    @objc dynamic var status: String?
    @objc dynamic var mode: String?
    @objc dynamic var imgUrl: String?
    @objc dynamic var sport: String?
    @objc dynamic var chatEnabled: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
