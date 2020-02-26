//
//  AudiobookType.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/24/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation

/// An enum used to differentiate the two primary types of audiobook files.
enum AudiobookType {
    /// an audiobook file in aac/m4b/m4a format
    case mp4
    /// an audiobook file in mp3 format
    case mp3
    /// an audiobook file not in a format handled by AudiobookTagger
    case invalid
}
