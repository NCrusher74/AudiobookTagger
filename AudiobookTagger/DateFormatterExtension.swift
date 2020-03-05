//
//  DateConstants.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/4/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
extension DateFormatter {
    
    internal static func deterministicFormatter() -> DateFormatter {
      let formatter = DateFormatter()
      formatter.locale = Locale(identifier: "en_US_POSIX")
      formatter.timeZone = TimeZone(secondsFromGMT: 0)
      return formatter
    }
}
