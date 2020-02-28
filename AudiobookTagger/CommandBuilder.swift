//
//  OutputArray.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/28/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import ID3TagEditor
import MP42Foundation

/// The output array is the array of tags that will be written to the output file.
struct CommandBuilder {
    var format: AudiobookType
    
    init(format: AudiobookType) {
        self.format = format
    }
    
    /// the array of ID3 frames being accessed
    var id3FrameArray: [FrameName: ID3Frame] = [:]
    
    /// the command that goes into ID3Tag.read or ID3tag.write
    func mp3Array() {
        _ = ID3Tag(
            version: .version3, frames: id3FrameArray)
    }
    
    /// the array of MP4 items being accessed
    var mp4MetadataArray: [MP42MetadataItem] = []
    
    /// the command to access those items for reading or writng
    func mp4Array(input: URL) throws {
        let mp42File = try MP42File(url: input)
        mp42File.metadata.addItems(mp4MetadataArray)
    }
    
}
