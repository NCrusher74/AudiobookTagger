//
//  MetadataMap.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/20/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

struct MetadataMap {
    
    var file: AudiobookFile
    
    init(file: AudiobookFile) {
        self.file = file
    }
    
}
