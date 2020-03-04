//
//  Constants.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/4/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation

struct Constants {
    
    private static var formatDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "MM-dd-yyyy"
        return formatter
    }
    static let dateFormat: DateFormatter = formatDate
}
