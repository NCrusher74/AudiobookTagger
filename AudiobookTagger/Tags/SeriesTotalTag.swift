//
//  SeriesTotalTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/2/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

/// returns ctotal books in series as an integer
struct SeriesTotalTag {
    
    var audiobookFile: AudiobookFile
    
    init(audiobookFile: AudiobookFile){
        self.audiobookFile = audiobookFile
    }
    
    func returnSeriesTotalMetadata() throws -> Int? {
        if self.audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                if let total = (id3Tag.frames[AudiobookTag.seriesTotal.id3Tag] as?
                    ID3FrameWithIntegerContent)?.value {
                    return total
                }
            }
        } else if self.audiobookFile.format == .mp4 {
            let mp4File = try MP42File(url: self.audiobookFile.audiobookUrl)
            let total = mp4File.metadata.metadataItemsFiltered(
                byIdentifier: AudiobookTag.seriesTotal.mp4Tag).first?.numberValue as! Int
            return total
        }; return nil
    }
}