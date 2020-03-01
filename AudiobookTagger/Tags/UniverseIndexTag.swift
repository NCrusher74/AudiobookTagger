//
//  UniverseIndexTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/1/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

/// returns current universe index and total books in universe as an integer array
struct UniverseIndexTag {
    
    var audiobookFile: AudiobookFile
    
    init(audiobookFile: AudiobookFile){
        self.audiobookFile = audiobookFile
    }
    
    func returnUniverseIndexMetadata() throws -> [Int] {
        if self.audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            var universeArray: [Int] = []
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                if let index = (id3Tag.frames[AudiobookTag.universeIndex.id3Tag] as?
                    ID3FrameMovementIndex)?.index {
                    universeArray.append(index)
                }
                if let universeTotal = (id3Tag.frames[AudiobookTag.universeIndex.id3Tag] as?
                    ID3FrameMovementIndex)?.totalMovements {
                    universeArray.append(universeTotal)
                }
                return universeArray
            }
        } else if self.audiobookFile.format == .mp4 {
            let mp4File = try MP42File(url: self.audiobookFile.audiobookUrl)
            let universeIndex = mp4File.metadata.metadataItemsFiltered(
                byIdentifier: AudiobookTag.universeIndex.mp4Tag).first?.numberValue as! Int
            let universeTotal = mp4File.metadata.metadataItemsFiltered(
                byIdentifier: MP42MetadataKeyMovementCount).first?.numberValue as! Int
            return [universeIndex,universeTotal]
        }; return []
    }
}
