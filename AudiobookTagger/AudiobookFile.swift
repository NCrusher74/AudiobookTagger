//
//  AudiobookFile.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/24/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

/// An audiobook file represents an audiobook file somewhere on disk.
///
/// This wrapper houses methods for querying or modifying information about the file.
struct AudiobookFile {
    
    /// the filepath of the audiobook file
    let audiobookUrl: URL
    
    init(from audiobookUrl: URL) {
        self.audiobookUrl = audiobookUrl
    }
    
    /// the format of the audiobook file
    var format: AudiobookType {
        let audiobookExtension = audiobookUrl.pathExtension
        let mp4types: [String] = ["aac", "mp4", "m4b", "m4a"]
        
        if mp4types.contains(audiobookExtension.lowercased()) {
            return AudiobookType.mp4
        } else if audiobookExtension.lowercased() == "mp3" {
            return AudiobookType.mp3
        } else {
            return AudiobookType.invalid
        }
    }
    
    
    func readAuthorMetadata(tag: AudiobookTag) throws -> String {
        switch self.format {
            case .mp3 :
                let id3TagEditor = ID3TagEditor()
                do {
                    let id3Reader = try id3TagEditor.read(from: self.audiobookUrl.path)
                    let id3Value = (id3Reader?.frames[tag.id3Tag] as? ID3FrameWithStringContent)?.content ?? ""
                    return id3Value
            }
            case .mp4 :
                let mp4File = try MP42File(url: self.audiobookUrl)
                return mp4File.metadata.metadataItemsFiltered(
                    byIdentifier: tag.mp4Tag).first?.stringValue ?? ""
            case .invalid :
                return ""
        }
    }
}
