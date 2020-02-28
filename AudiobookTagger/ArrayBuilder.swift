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
struct ArrayBuilder {
    var format: AudiobookType
    
    init(format: AudiobookType) {
        self.format = format
    }
    
    
    var id3FrameArray: [FrameName: ID3Frame] = [:]
    
    /// the array of ID3 frames being accessed
    func mp3Array(input: String, output: String) {
        _ = ID3TagEditor()
        _ = ID3Tag(
            version: .version3, frames: id3FrameArray)
    }
    
   
    var mp4MetadataArray: [MP42MetadataItem] = []
    
     /// the array of MP4 frames being accessed
    func mp4Array(input: URL, output: URL) throws {
        let mp42File = try MP42File(url: input)
        mp42File.metadata.addItems(mp4MetadataArray)
    }
    
}
