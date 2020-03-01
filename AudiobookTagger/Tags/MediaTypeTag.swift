//
//  MediaTypeTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/1/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

/// returns the contents of the Media Type tag as a string;
/// in the case of MP4 files returns a string describing the integer values of the "stik" atom
struct MediaTypeTag {
    
    var audiobookFile: AudiobookFile
    
    init(audiobookFile: AudiobookFile){
        self.audiobookFile = audiobookFile
    }
    
    func returnMediaTypeMetadata() throws -> String {
        if self.audiobookFile.format == .mp3 {
            let id3TagEditor = ID3TagEditor()
            if let id3Tag = try id3TagEditor.read(from: self.audiobookFile.audiobookUrl.path) {
                return (id3Tag.frames[AudiobookTag.mediaType.id3Tag] as?
                    ID3FrameWithStringContent)?.content ?? ""
            }
        } else if self.audiobookFile.format == .mp4 {
            let mp4File = try MP42File(url: self.audiobookFile.audiobookUrl)
            let returnInt = mp4File.metadata.metadataItemsFiltered(
                byIdentifier: AudiobookTag.mediaType.mp4Tag).first?.numberValue
            if returnInt == 2 {
                return "Audiobook"
            } else if returnInt == 21 {
                return "Podcast"
            } else if returnInt == 11 {
                return "Periodical"
            } else {
                return ""
            }
        }; return ""
    }
    
    
    
}
