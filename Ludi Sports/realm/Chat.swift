//
//  Team.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation
import RealmSwift

class Chat: Object, Codable {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var senderId: String? = nil
    @objc dynamic var senderName: String? = nil
    @objc dynamic var chatId: String? = nil
    @objc dynamic var receiverId: String? = nil
    @objc dynamic var messageText: String? = nil
    @objc dynamic var timestamp: Int = 0

    override static func primaryKey() -> String? {
        return "id"
    }
}

