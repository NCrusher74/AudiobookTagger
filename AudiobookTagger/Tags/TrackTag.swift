//
//  TrackTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/1/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

/// returns current track number and total tracks as an integer array
struct TrackTag {
    
    var audiobookFile: AudiobookFile
    
    init(audiobookFile: AudiobookFile){
        self.audiobookFile = audiobookFile
    }
    
    func returnTrackMetadata() throws -> [Int] {
        if self.audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            var trackArray: [Int] = []
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                if let track = (id3Tag.frames[AudiobookTag.track.id3Tag] as?
                    ID3FramePartOfTotal)?.part {
                    trackArray.append(track)
                }
                if let trackTotal = (id3Tag.frames[AudiobookTag.track.id3Tag] as?
                    ID3FramePartOfTotal)?.total {
                    trackArray.append(trackTotal)
                }
                return trackArray
            }
        } else if self.audiobookFile.format == .mp4 {
            let mp4File = try MP42File(url: self.audiobookFile.audiobookUrl)
            return mp4File.metadata.metadataItemsFiltered(
                byIdentifier: AudiobookTag.track.mp4Tag).first?.arrayValue as! [Int]
        }; return []
    }
}
