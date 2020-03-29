//
//  AudiobookTaggerTests.swift
//  AudiobookTaggerTests
//
//  Created by Nolaine Crusher on 2/20/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import XCTest
import ID3TagEditor
@testable import AudiobookTagger

class ID3TagEditorTests: XCTestCase {
    
    func testID3() throws {
        let id3TagEditor = ID3TagEditor()
        if let id3Tag = try id3TagEditor.read(from: Bundle.testMp3FullMeta.path) {
            
            XCTAssertEqual((id3Tag.frames[.Title] as? ID3FrameWithStringContent)?.content, "Title")
            XCTAssertEqual((id3Tag.frames[.Album] as? ID3FrameWithStringContent)?.content, "Album")
            XCTAssertEqual((id3Tag.frames[.Artist] as? ID3FrameWithStringContent)?.content, "Artist")
            XCTAssertEqual((id3Tag.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content, "AlbumArtist")
            XCTAssertEqual((id3Tag.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer")
            XCTAssertEqual((id3Tag.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor")
            XCTAssertEqual((id3Tag.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "WorkName")
            XCTAssertEqual((id3Tag.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "2020 Copyright")
            XCTAssertEqual((id3Tag.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist")
            XCTAssertEqual((id3Tag.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "Audiobook")
            XCTAssertEqual((id3Tag.frames[.ITunesMovementName] as? ID3FrameWithStringContent)?.content, "MovementName")
            XCTAssertEqual((id3Tag.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher")
            XCTAssertEqual((id3Tag.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Description")
            XCTAssertEqual((id3Tag.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 3)
            XCTAssertEqual((id3Tag.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 4)
            XCTAssertEqual((id3Tag.frames[.TrackPosition] as? ID3FramePartOfTotal)?.part, 1)
            XCTAssertEqual((id3Tag.frames[.TrackPosition] as? ID3FramePartOfTotal)?.total, 2)
            XCTAssertEqual((id3Tag.frames[.Genre] as? ID3FrameGenre)?.identifier, nil)
            XCTAssertEqual((id3Tag.frames[.Genre] as? ID3FrameGenre)?.description, "Genre")
            let txxxFrame = id3Tag.frames[.UserDefinedTextInformation] as?ID3FrameUserDefinedText
            //print(txxxFrame?.description) // Sort Series
            print([txxxFrame?.description].count)
        }
    }
        
}
