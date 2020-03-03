//
//  SeriesIndexTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/1/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

/// returns current series index and total books in series as an integer array
struct SeriesIndexTag {
    
    var audiobookFile: AudiobookFile
    
    init(audiobookFile: AudiobookFile){
        self.audiobookFile = audiobookFile
    }
    
    func returnSeriesIndexMetadata() throws -> Int? {
        if self.audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                if let index = (id3Tag.frames[AudiobookTag.seriesIndex.id3Tag] as?
                    ID3FrameWithIntegerContent)?.value {
                    return index
                }
            }
        } else if self.audiobookFile.format == .mp4 {
            let mp4File = try MP42File(url: self.audiobookFile.audiobookUrl)
            let index = mp4File.metadata.metadataItemsFiltered(
                byIdentifier: AudiobookTag.seriesIndex.mp4Tag).first?.numberValue as! Int
            return index
        }; return nil
    }
}
