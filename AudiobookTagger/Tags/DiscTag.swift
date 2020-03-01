//
//  DiscTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/1/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

/// returns current disc number and total discs as an integer array
struct DiscTag {
    
    var audiobookFile: AudiobookFile
    
    init(audiobookFile: AudiobookFile){
        self.audiobookFile = audiobookFile
    }
    
    func returnDiscMetadata() throws -> [Int] {
        if self.audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            var discArray: [Int] = []
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                if let disc = (id3Tag.frames[AudiobookTag.disc.id3Tag] as?
                    ID3FrameDiscPosition)?.position {
                    discArray.append(disc)
                }
                if let discTotal = (id3Tag.frames[AudiobookTag.disc.id3Tag] as?
                    ID3FrameDiscPosition)?.totalDiscs {
                    discArray.append(discTotal)
                }
                return discArray
            }
        } else if self.audiobookFile.format == .mp4 {
            let mp4File = try MP42File(url: self.audiobookFile.audiobookUrl)
            return mp4File.metadata.metadataItemsFiltered(
                byIdentifier: AudiobookTag.disc.mp4Tag).first?.arrayValue as! [Int]
        }; return []
    }
}
