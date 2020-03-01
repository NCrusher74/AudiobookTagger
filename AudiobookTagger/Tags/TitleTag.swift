//
//  TitleTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/1/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

/// Returns the contents of the Title tag as a string
struct TitleTag {
    
    var audiobookFile: AudiobookFile
    
    init(audiobookFile: AudiobookFile){
        self.audiobookFile = audiobookFile
    }
    
    func returnTitleMetadata() throws -> String {
        if self.audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                return (id3Tag.frames[AudiobookTag.title.id3Tag] as?
                    ID3FrameWithStringContent)?.content ?? ""
            }
        } else if self.audiobookFile.format == .mp4 {
            let mp4File = try MP42File(url: self.audiobookFile.audiobookUrl)
            return mp4File.metadata.metadataItemsFiltered(
                byIdentifier: AudiobookTag.title.mp4Tag).first?.stringValue ?? ""
        }; return ""
    }
    
    
    
}