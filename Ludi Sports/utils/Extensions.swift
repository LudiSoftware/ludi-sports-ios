//
//  Extensions.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/26/23.
//

import Foundation


extension Optional {
    
    
    func `let`<T>(_ transform: (Wrapped) throws -> T) rethrows -> T? {
        return try map(transform)
    }
    
}
