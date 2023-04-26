//
//  User.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift
import FirebaseAuth

// MARK: - User

class User: Object, Codable {
    @objc dynamic var id: String = ""
    @objc dynamic var username: String = AuthTypes.unassigned.rawValue
    @objc dynamic var auth: String = AuthTypes.basicUser.rawValue
    @objc dynamic var email: String = AuthTypes.unassigned.rawValue
    @objc dynamic var phone: String = AuthTypes.unassigned.rawValue
    @objc dynamic var organization: String = AuthTypes.unassigned.rawValue
    @objc dynamic var organizationId: String = AuthTypes.unassigned.rawValue
    @objc dynamic var visibility: String = "closed"
    @objc dynamic var photoUrl: String = AuthTypes.unassigned.rawValue
    @objc dynamic var emailVerified: Bool = false
    @objc dynamic var parent: Bool = false
    @objc dynamic var player: Bool = false
    @objc dynamic var coach: Bool = false
    @objc dynamic var coachUser: Bool = false
    @objc dynamic var playerUser: Bool = false
    @objc dynamic var dateCreated: String = getTimeStamp()
    @objc dynamic var dateUpdated: String = getTimeStamp()
    @objc dynamic var name: String? = nil
    @objc dynamic var firstName: String? = nil
    @objc dynamic var lastName: String? = nil
    @objc dynamic var type: String? = nil
    @objc dynamic var subType: String? = nil
    @objc dynamic var details: String? = nil
    @objc dynamic var isFree: Bool = false
    @objc dynamic var status: String? = nil
    @objc dynamic var mode: String? = nil
    @objc dynamic var imgUrl: String? = nil
    @objc dynamic var sport: String? = nil

    override class func primaryKey() -> String? {
        return "id"
    }


}



// MARK: - FirebaseUser Extensions

extension FirebaseAuth.User {
    func fromFirebaseToRealmUser() -> User {
        let uid = self.uid
        let email = self.email ?? "UNKNOWN"
        let name = self.displayName ?? "UNKNOWN"
        let photoUrl = self.photoURL
        let emailVerified = self.isEmailVerified
        realm().executeCreateUserObject(userId: uid)
        let user = User()
        user.id = uid
        user.email = email
        user.name = name
        user.photoUrl = photoUrl?.absoluteString ?? ""
        user.imgUrl = photoUrl?.absoluteString ?? ""
        user.emailVerified = emailVerified
        return user
    }
}



// MARK: - Realm Extensions

extension Realm {
    // TODO: Add safeUser, safeUserId, realmUser, getRealmUserById, queryForUserById, executeCreateUserObject, getUserId, userOrLogout functions.
    // Note: You will need to create equivalent Swift methods for the functions found in the Kotlin code. Some methods might need adjustments to fit the Swift and iOS environment.
    
    func executeCreateUserObject(userId: String) {
        safeWrite { realm in
            let user = User()
            user.id = userId
            realm.add(user, update: .modified)
        }
    }

    
    func queryForUserById(userId: String) -> User? {
        return objects(User.self).filter("id == %@", userId).first
    }

    func realmUser() -> User? {
        guard let uid = coreFirebaseUserUid() else { return nil }
        return queryForUserById(userId: uid)
    }

    func safeUser(block: (User) -> Void) {
        if let user = realmUser() {
            guard !user.id.isEmpty else { return }
            block(user)
        }
    }

    func safeUserId(block: (String) -> Void) {
        if let userId = realmUser()?.id {
            block(userId)
        }
    }

}
