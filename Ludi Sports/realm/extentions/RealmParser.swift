//
//  RealmParser.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/25/23.
//
import RealmSwift


extension Results where Element: Object {
    func toList() -> List<Element> {
        let list = List<Element>()
        forEach { list.append($0) }
        return list
    }
}

