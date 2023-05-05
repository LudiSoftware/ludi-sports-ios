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
    
    init(realmIds: [String], realmInstance: Realm) {
        self.realmIds = realmIds
        self.realmInstance = realmInstance
        self.reference = Database.database().reference().child(DatabasePaths.teams.rawValue)
        super.init()
        createObservers()
        observeRealmIds()
    }
    
    // Create Observer Pairs
    private func createObservers() {
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
    
    // Realm Observer
    private func observeRealmIds() {
        let results = realmInstance.objects(Team.self)
        for result in results {
            let token = result.observe { [weak self] _ in
                guard let self = self else { return }
                let currentList = self.realmIds.compactMap { id in
                    self.realmInstance.object(ofType: Team.self, forPrimaryKey: id)
                }
                if currentList.contains(result) {
                    // Handle data update here
                }
            }
            notificationTokens.append(token)
        }
    }
    
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



