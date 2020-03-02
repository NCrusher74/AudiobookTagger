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
    
    func returnReleaseDateMetadata() throws -> Date {
        if audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                if let day = (id3Tag.frames[AudiobookTag.releaseDate.id3Tag] as?
                    ID3FrameRecordingDayMonth)?.day {
                    // add day
                }
                if let month = (id3Tag.frames[AudiobookTag.releaseDate.id3Tag] as?
                    ID3FrameRecordingDayMonth)?.month {
                    // add month
                }
                if let year = (id3Tag.frames[AudiobookTag.year.id3Tag] as?
                    ID3FrameRecordingYear)?.year {
                    // add month
                }
                // return day/month/year as formatted date
            }
        } else if audiobookFile.format == .mp4 {
            let mp4File = try MP42File(url: self.audiobookFile.audiobookUrl)
            let dateString = mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyReleaseDate).first?.stringValue
            // ... and then?
        }
    }
    
    
    
}
