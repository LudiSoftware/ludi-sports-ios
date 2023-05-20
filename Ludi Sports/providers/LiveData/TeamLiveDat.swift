//
//  TeamLiveDat.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/26/23.
//

import Foundation
import Firebase
import RealmSwift

protocol ValueEventListener {
    func onDataChange(snapshot: DataSnapshot)
    func onCancelled(error: Error)
}

class TeamLiveData: NSObject {
    private let realmIds: [String]
    private let realmInstance: Realm
    private var fireReferences: [String: DatabaseReference] = [:]
    private var notificationTokens: [NotificationToken] = []
    private var reference: DatabaseReference
    private var enabled = false
    
    init(realmIds: [String], realmInstance: Realm, fun: @escaping (() -> Void)) {
        self.realmIds = realmIds
        self.realmInstance = realmInstance
        self.reference = Database.database().reference().child(DatabasePaths.teams.rawValue)
        super.init()
        createObservers()
        observeRealmIds(completion: fun)
    }
    
    // Create Observer Pairs
     func createObservers() {
        for realmId in realmIds {
            let referenceChild = reference.child(realmId)
            fireReferences[realmId] = referenceChild
            if enabled {
                referenceChild.observe(.value, with: { [weak self] snapshot in
                    self?.onDataChange(snapshot: snapshot)
                })
            }
        }
    }
    func observeRealmIds(completion: (() -> Void)? = nil) {
        let results = realmInstance.objects(Team.self)
        print(results)
        // Iterate through the list of Team objects
        for result in results {
            // Observe changes for each Team object
            let token = result.observe { _ in
                // Get the current list of Teams based on realmIds
                let currentList = self.realmIds.compactMap { id in
                    self.realmInstance.object(ofType: Team.self, forPrimaryKey: id)
                }
                // Check if the observed Team is in the current list
                print(currentList)
                if currentList.contains(result) {
                    completion?()
                }
            }
            notificationTokens.append(token)
            print(token)
        }
    }



   
    // Realm Observer
//     func observeRealmIds(completion: (() -> Void)? = nil) {
//        let results = realmInstance.objects(Team.self)
//         print(results)
//        for result in results {
//            let token = result.observe { [weak self] _ in
//                if let self = self {
//                    let currentList = self.realmIds.compactMap { id in
//                        self.realmInstance.object(ofType: Team.self, forPrimaryKey: id)
//                    }
//                    if currentList.contains(result) {
//                        // Handle data update here
//
//                        completion?()
//
//                    }
//
//                }
//
//            }
//            notificationTokens.append(token)
//            print(token)
//
//        }
//    }
    
    // Firebase Observer
    private func onDataChange(snapshot: DataSnapshot) {
        // Handle snapshot data conversion and update here
        var _ = snapshot.toLudiObject(Team.self, realm: realmInstance)
    }
    
    // Enable/Disable Helpers
    func enable() {
        if enabled { return }
        enabled = true
        for (_, reference) in fireReferences {
            reference.observe(.value, with: { [weak self] snapshot in
                self?.onDataChange(snapshot: snapshot)
            })
        }
    }
    
    func disable() {
        if !enabled { return }
        enabled = false
        for (_, reference) in fireReferences {
            reference.removeAllObservers()
        }
    }
}



