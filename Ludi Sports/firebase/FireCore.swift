//
//  FireCore.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/25/23.
//

import Foundation
import FirebaseAuth

enum DatabasePaths: String {
    case sports = "sports"
    case users = "users"
    case admin = "admin"
    case coaches = "coaches"
    case parents = "parents"
    case players = "players"
    case reviews = "reviews"
    case services = "services"
    case organizations = "organizations"
    case teams = "teams"
    case notes = "notes"
    case chat = "chat"
    case evaluations = "evaluations"
    case rosters = "rosters"
    case tryouts = "tryouts"
    case reviewTemplates = "review_templates"
}

func coreFirebaseUser() -> FirebaseAuth.User? {
    return Auth.auth().currentUser
}

func coreFirebaseUserUid() -> String? {
    return Auth.auth().currentUser?.uid
}

//func coreFireLogoutAsync(context: UIViewController, completion: @escaping (Result<Void, Error>) -> Void) {
//    let authUI = FirebaseAuth.defaultAuthUI()
//    authUI?.signOut(with: context, completion: { (error) in
//        if let error = error {
//            completion(.failure(error))
//        } else {
//            completion(.success(()))
//        }
//    })
//}

