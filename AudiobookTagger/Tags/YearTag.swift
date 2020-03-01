//
//  YearTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/1/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import ID3TagEditor
import MP42Foundation

/// returns the year of the audiobook's release as an integer
struct YearTag {
    
    var audiobookFile: AudiobookFile
    
    init(audiobookFile: AudiobookFile) {
        self.audiobookFile = audiobookFile
    }
    
    func returnReleaseYearMetadata() throws -> Int? {
        if audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                return (id3Tag.frames[AudiobookTag.year.id3Tag] as?
                    ID3FrameRecordingYear)?.year
            }
        }
    }
    
    
    
}
