//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class Location: Object {
    @objc dynamic var id: String = UUID().uuidString
//    @objc dynamic var address: Address?
    var managerIds = List<String>()
    var organizationIds = List<String>()
    var reviewIds = List<String>()
    var sports = List<String>()
    var fields = List<String>()
    var imgUris = List<String>()
    @objc dynamic var parkingInfo: String? = nil
    @objc dynamic var estPeople: String? = nil
    @objc dynamic var hasReview: Bool = false
    @objc dynamic var atmosphere: String? = "outdoor"
    @objc dynamic var bathrooms: Bool = false
    @objc dynamic var lights: Bool = false
    @objc dynamic var water: Bool = false
    @objc dynamic var lockerRooms: Bool = false
    @objc dynamic var concessions: Bool = false
    @objc dynamic var wifi: Bool = false
    @objc dynamic var parking: Bool = false
    @objc dynamic var handicap: Bool = false
    @objc dynamic var googlePlaceBusinessStatus: String? = nil
    @objc dynamic var googlePlaceLat: String? = nil
    @objc dynamic var googlePlaceLng: String? = nil
    @objc dynamic var googlePlaceIcon: String? = nil
    @objc dynamic var iconBackgroundColor: String? = nil
    @objc dynamic var iconMaskBaseUri: String? = nil
    @objc dynamic var googlePlaceName: String? = nil
    var googlePlacePhotos = List<String>()
    @objc dynamic var googlePlaceId: String? = nil
    @objc dynamic var googlePlaceRating: String? = nil
    @objc dynamic var googlePlaceScope: String? = nil
    var googlePlaceTypes = List<String>()
    @objc dynamic var googlePlaceUserRatingsTotal: Int = 0
    @objc dynamic var googlePlaceAddress: String? = nil
    @objc dynamic var googlePlaceCsz: String? = nil
    @objc dynamic var googlePlaceCategory: String? = nil
    @objc dynamic var dateCreated: String? = nil
    @objc dynamic var dateUpdated: String? = nil
    @objc dynamic var name: String? = nil
    @objc dynamic var type: String? = nil
    @objc dynamic var subType: String? = nil
    @objc dynamic var details: String? = nil
    @objc dynamic var isFree: Bool = false
    @objc dynamic var status: String? = nil
    @objc dynamic var mode: String? = nil
    @objc dynamic var imgUrl: String? = nil
    @objc dynamic var sport: String? = nil
    @objc dynamic var chatEnabled: Bool = false

    override static func primaryKey() -> String? {
        return "id"
    }
}

