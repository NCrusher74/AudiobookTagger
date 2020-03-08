//
//  OutcastID3Tests.swift
//  AudiobookTaggerTests
//
//  Created by Nolaine Crusher on 3/7/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import XCTest
import OutcastID3

@testable import AudiobookTagger

class OutcastID3Tests: XCTestCase {
    
    func testMP3AudiobookTag() throws {
        XCTAssertEqual(AudiobookTag.authors.outcastType, OutcastID3.Frame.StringFrame.StringType.leadArtist)
        XCTAssertEqual(AudiobookTag.bookTitle.outcastType, OutcastID3.Frame.StringFrame.StringType.albumTitle)
        XCTAssertEqual(AudiobookTag.category.outcastType, OutcastID3.Frame.StringFrame.StringType.category)
        XCTAssertEqual(AudiobookTag.copyright.outcastType, OutcastID3.Frame.StringFrame.StringType.copyright)
        XCTAssertEqual(AudiobookTag.disc.outcastType, OutcastID3.Frame.StringFrame.StringType.partOfASet)
        XCTAssertEqual(AudiobookTag.genre.outcastType, OutcastID3.Frame.StringFrame.StringType.contentType)
        XCTAssertEqual(AudiobookTag.keywords.outcastType, OutcastID3.Frame.StringFrame.StringType.keywords)
        XCTAssertEqual(AudiobookTag.mediaType.outcastType, OutcastID3.Frame.StringFrame.StringType.mediaType)
        XCTAssertEqual(AudiobookTag.narrators.outcastType, OutcastID3.Frame.StringFrame.StringType.composer)
        XCTAssertEqual(AudiobookTag.primaryAuthor.outcastType, OutcastID3.Frame.StringFrame.StringType.band)
        XCTAssertEqual(AudiobookTag.publisher.outcastType, OutcastID3.Frame.StringFrame.StringType.publisher)
        XCTAssertEqual(AudiobookTag.releaseDate.outcastType, OutcastID3.Frame.StringFrame.StringType.recordingDate)
        XCTAssertEqual(AudiobookTag.series.outcastType, OutcastID3.Frame.StringFrame.StringType.contentGroupDescription)
        XCTAssertEqual(AudiobookTag.seriesIndex.outcastType, OutcastID3.Frame.StringFrame.StringType.seriesIndex)
        XCTAssertEqual(AudiobookTag.seriesTotal.outcastType, OutcastID3.Frame.StringFrame.StringType.seriesCount)
        XCTAssertEqual(AudiobookTag.title.outcastType, OutcastID3.Frame.StringFrame.StringType.title)
        XCTAssertEqual(AudiobookTag.track.outcastType, OutcastID3.Frame.StringFrame.StringType.track)
        XCTAssertEqual(AudiobookTag.universe.outcastType, OutcastID3.Frame.StringFrame.StringType.movementName)
        XCTAssertEqual(AudiobookTag.universeIndex.outcastType, OutcastID3.Frame.StringFrame.StringType.movementIndex)
        XCTAssertEqual(AudiobookTag.universeTotal.outcastType, OutcastID3.Frame.StringFrame.StringType.movementCount)
        
        let outcastFile = try OutcastID3.MP3File(localUrl: Bundle.testMp3NoMeta)
        _ = try outcastFile.readID3Tag().tag
        //print(outcastTag.version)
        
        let frames: [OutcastID3TagFrame] = [
            OutcastID3.Frame.StringFrame(type: AudiobookTag.authors.outcastType!,
                                         encoding: .utf8, str: "Author Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.bookTitle.outcastType!,
                                         encoding: .utf8, str: "BookTitle Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.category.outcastType!,
                                         encoding: .utf8, str: "Category Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.copyright.outcastType!,
                                         encoding: .utf8, str: "Copyright Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.disc.outcastType!,
                                         encoding: .utf8, str: "1/2"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.genre.outcastType!,
                                         encoding: .utf8, str: "Genre Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.keywords.outcastType!,
                                         encoding: .utf8, str: "Keywords Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.mediaType.outcastType!,
                                         encoding: .utf8, str: "MediaType Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.narrators.outcastType!,
                                         encoding: .utf8, str: "Narrator Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.primaryAuthor.outcastType!,
                                         encoding: .utf8, str: "PrimaryAuthor Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.publisher.outcastType!,
                                         encoding: .utf8, str: "Publisher Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.releaseDate.outcastType!,
                                         encoding: .utf8, str: "05/08/1999"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.series.outcastType!,
                                         encoding: .utf8, str: "Series Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.seriesIndex.outcastType!,
                                         encoding: .utf8, str: "3"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.seriesTotal.outcastType!,
                                         encoding: .utf8, str: "4"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.title.outcastType!,
                                         encoding: .utf8, str: "Title Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.track.outcastType!,
                                         encoding: .utf8, str: "5/6"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.universe.outcastType!,
                                         encoding: .utf8, str: "Universe Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.universeIndex.outcastType!,
                                         encoding: .utf8, str: "7"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.universeTotal.outcastType!,
                                         encoding: .utf8, str: "8"),
            OutcastID3.Frame.CommentFrame(encoding: .utf8, language: "eng", commentDescription: "description", comment: "Comment Test"),
            OutcastID3.Frame.TranscriptionFrame(encoding: .utf8, language: "eng", lyricsDescription: "description", lyrics: "Summary Test")
        ]
        
        let tag = OutcastID3.ID3Tag(
            version: .v2_4,
            frames: frames
        )
        
        let outputUrl = URL(fileURLWithPath: NSHomeDirectory() + "/outcast-testfile.mp3")
        XCTAssertNoThrow(try outcastFile.writeID3Tag(tag: tag, outputUrl: outputUrl)) /*<unknown>:0: error: -[AudiobookTaggerTests.OutcastID3Tests testMP3AudiobookTag] : failed: caught error: The operation couldn’t be completed. (OutcastID3.OutcastID3.MP3File.ReadError error 0.)*/
    }
}
