//
//  DateConstants.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/4/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
extension DateFormatter {
    
    func dateFromMultipleFormats(_ fromString: String) -> Date? {
        let formats: [String] = [
            "MM-dd-yyyy",
            "MMM-dd-yyyy",
            "MMMM-dd-yyyy",
            "MM-dd-yy",
            "MMM-dd-yy",
            "MMMM-dd-yy",
            "dd-MM-yyyy",
            "dd-MMM-yyyy",
            "dd-MMMM-yyyy",
            "dd-MM-yy",
            "dd-MMM-yy",
            "dd-MMMM-yy",
            "yyyy-MM-dd",
            "yyyy-MMM-dd",
            "yyyy-MMMM-dd",
            "yy-MM-dd",
            "yy-MMM-dd",
            "yy-MMMM-dd"
        ]
        for format in formats {
            self.dateFormat = format
            if let date = self.date(from: fromString) {
                return date
            }
        }
        return nil
    }
    
    public static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
}
