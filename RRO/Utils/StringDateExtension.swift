//
//  StringDateFormaterExtension.swift
//  RRO
//
//  Created by peblo on 02/11/23.
//

import Foundation

extension String {
    func toISODate(_ timeZone: TimeZone = TimeZone.current) -> Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        formatter.timeZone = TimeZone.current
        
        guard let formatted = formatter.date(from: self) else {
            debugPrint("ERROR decoding string to date")
            return Date()
        }
        
        return formatted
    }
}

extension Date {
    func toString(_ formatter: DateFormatter = DateFormatter()) -> String {
        // TODO: Check if it errors
        return formatter.string(from: self)
    }
}
