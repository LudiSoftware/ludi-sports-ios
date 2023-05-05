//
//  FireData.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/26/23.
//

import Foundation
import FirebaseDatabase

func firebaseDatabase(block: @escaping (DatabaseReference) -> Void) {
    let reference = Database.database().reference()
    block(reference)
}

func firebaseDatabase(collection: String, block: @escaping (DatabaseReference) -> Void) {
    let reference = Database.database().reference().child(collection)
    block(reference)
}
