//
//  DateTime.swift
//  Ludi Sports
//
//  Created by Charles Romeo on 4/24/23.
//

import Foundation

func getTimeStamp() -> String {
    let current = Locale(identifier: "en_US")
    let dateFormatter = DateFormatter()

    do {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = current
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: Date())
    } catch {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = current
        return dateFormatter.string(from: Date())
    }
}
