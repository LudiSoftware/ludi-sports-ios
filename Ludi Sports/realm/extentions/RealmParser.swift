//
//  RealmParser.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/25/23.
//

import Foundation
import RealmSwift
import SwiftUI

extension Results {
    func toArray<T>(_ type: T.Type) -> [T] {
        return compactMap { $0 as? T }
    }
}

