//
//  AuthorTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/29/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

/// returns the contents of the Artist tag as a string
struct AuthorTag {
    
    var audiobookFile: AudiobookFile
    
    init(audiobookFile: AudiobookFile){
        self.audiobookFile = audiobookFile
    }
    
    func returnAuthorMetadata() throws -> String {
        if self.audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                return (id3Tag.frames[AudiobookTag.authors.id3Tag] as?
                    ID3FrameWithStringContent)?.content ?? ""
            }
        } else if self.audiobookFile.format == .mp4 {
            let mp4File = try MP42File(url: self.audiobookFile.audiobookUrl)
            return mp4File.metadata.metadataItemsFiltered(
                byIdentifier: AudiobookTag.authors.mp4Tag).first?.stringValue ?? ""
        }; return ""
    }
    

    
    
}
