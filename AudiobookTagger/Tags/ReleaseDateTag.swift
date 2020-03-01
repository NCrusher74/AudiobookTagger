//
//  ReleaseDateTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/1/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import ID3TagEditor
import MP42Foundation

/// returns the fully formatted release date
struct ReleaseDateTag {
    
    var audiobookFile: AudiobookFile
    
    init(audiobookFile: AudiobookFile) {
        self.audiobookFile = audiobookFile
    }
    
    func returnReleaseDateMetadata() -> Date {
        
    }
    
    
    
}
