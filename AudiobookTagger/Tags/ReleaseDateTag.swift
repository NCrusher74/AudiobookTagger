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
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        if audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                var day: Int?
                var month: Int?
                var year: Int?
                if (id3Tag.frames[AudiobookTag.releaseDate.id3Tag] as?
                    ID3FrameRecordingDayMonth)?.day != 0 {
                    day = ((id3Tag.frames[AudiobookTag.releaseDate.id3Tag] as?
                        ID3FrameRecordingDayMonth)?.day ?? 00)
                }
                if (id3Tag.frames[AudiobookTag.releaseDate.id3Tag] as?
                    ID3FrameRecordingDayMonth)?.month != 0 {
                    month = ((id3Tag.frames[AudiobookTag.releaseDate.id3Tag] as?
                        ID3FrameRecordingDayMonth)?.month ?? 00)
                }
                if (id3Tag.frames[AudiobookTag.year.id3Tag] as?
                    ID3FrameRecordingYear)?.year != 0 {
                    year = ((id3Tag.frames[AudiobookTag.year.id3Tag] as?
                        ID3FrameRecordingYear)?.year ?? 0000)
                }
                let dateString = "\(month ?? 00)/\(day ?? 00)/\(year ?? 0000)"
                return formatter.date(from: dateString) ?? Date()
            }
        } else if audiobookFile.format == .mp4 {
            let mp4File = try MP42File(url: self.audiobookFile.audiobookUrl)
            guard let mp4Date = mp4File.metadata.metadataItemsFiltered(
                byIdentifier: MP42MetadataKeyReleaseDate).first?.dateValue else { return Date() }
            return mp4Date
        }; return Date()
    }
    
    
    
}
