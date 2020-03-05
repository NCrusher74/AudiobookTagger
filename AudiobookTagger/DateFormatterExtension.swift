//
//  DateConstants.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/4/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
extension DateFormatter {
    
    // This would be clever if the formats were mutually exclusive. Unfortunately they aren’t. What does 01-02-03 mean? You want that to do what the user has the system configured to do, not just take the first one that happens to be a possibility.
    /*func dateFromMultipleFormats(_ fromString: String) -> Date? {
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
    }*/

    internal static func deterministicFormatter() -> DateFormatter {
      let formatter = DateFormatter()
      formatter.locale = Locale(identifier: "en_US_POSIX")
      formatter.timeZone = TimeZone(secondsFromGMT: 0)
      return formatter
    }
}
