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
    
    func testOutcastFunctionality() throws {
        // with test frameType implementation in AudiobookTag
        XCTAssertEqual(AudiobookTag.authors.outcastType, OutcastID3.Frame.StringFrame.StringType.leadArtist)
        XCTAssertEqual(AudiobookTag.bookTitle.outcastType, OutcastID3.Frame.StringFrame.StringType.albumTitle)
        XCTAssertEqual(AudiobookTag.copyright.outcastType, OutcastID3.Frame.StringFrame.StringType.copyright)
        XCTAssertEqual(AudiobookTag.disc.outcastType, OutcastID3.Frame.StringFrame.StringType.partOfASet)
        XCTAssertEqual(AudiobookTag.genre.outcastType, OutcastID3.Frame.StringFrame.StringType.contentType)
        XCTAssertEqual(AudiobookTag.mediaType.outcastType, OutcastID3.Frame.StringFrame.StringType.mediaType)
        XCTAssertEqual(AudiobookTag.narrators.outcastType, OutcastID3.Frame.StringFrame.StringType.composer)
        XCTAssertEqual(AudiobookTag.primaryAuthor.outcastType, OutcastID3.Frame.StringFrame.StringType.band)
        XCTAssertEqual(AudiobookTag.publisher.outcastType, OutcastID3.Frame.StringFrame.StringType.publisher)
        XCTAssertEqual(AudiobookTag.releaseDate.outcastType, OutcastID3.Frame.StringFrame.StringType.recordingDate)
        XCTAssertEqual(AudiobookTag.series.outcastType, OutcastID3.Frame.StringFrame.StringType.contentGroupDescription)
        XCTAssertEqual(AudiobookTag.title.outcastType, OutcastID3.Frame.StringFrame.StringType.title)
        XCTAssertEqual(AudiobookTag.track.outcastType, OutcastID3.Frame.StringFrame.StringType.track)
                        
       let frames: [OutcastID3TagFrame] = [
            OutcastID3.Frame.StringFrame(type: AudiobookTag.authors.outcastType!,
                                         encoding: .utf8, str: "Artist Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.bookTitle.outcastType!,
                                         encoding: .utf8, str: "Album Test"),
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
                                         encoding: .utf8, str: "Composer Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.primaryAuthor.outcastType!,
                                         encoding: .utf8, str: "Band Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.publisher.outcastType!,
                                         encoding: .utf8, str: "Publisher Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.releaseDate.outcastType!,
                                         encoding: .utf8, str: "05/08/1999"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.series.outcastType!,
                                         encoding: .utf8, str: "ContentGroupDescription Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.seriesIndex.outcastType!,
                                         encoding: .utf8, str: "3"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.seriesTotal.outcastType!,
                                         encoding: .utf8, str: "4"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.title.outcastType!,
                                         encoding: .utf8, str: "Title Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.track.outcastType!,
                                         encoding: .utf8, str: "5/6"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.universe.outcastType!,
                                         encoding: .utf8, str: "MovementName Test"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.universeIndex.outcastType!,
                                         encoding: .utf8, str: "7"),
            OutcastID3.Frame.StringFrame(type: AudiobookTag.universeTotal.outcastType!,
                                         encoding: .utf8, str: "8"),
            OutcastID3.Frame.CommentFrame(encoding: .utf8, language: "eng", commentDescription: "description", comment: "Comment Test"),
            OutcastID3.Frame.TranscriptionFrame(encoding: .utf8, language: "eng", lyricsDescription: "description", lyrics: "Lyrics Test")
        ]

        let tag = OutcastID3.ID3Tag(
            version: .v2_4,
            frames: frames
        )
        let inputFile = try OutcastID3.MP3File(localUrl: Bundle.testMp3FullMeta)
        let outputUrl = URL(fileURLWithPath: NSHomeDirectory() + "/outcast-testfile.mp3")
        XCTAssertNoThrow(try inputFile.writeID3Tag(tag: tag, outputUrl: outputUrl))
        
        
        let outputFile = try OutcastID3.MP3File(localUrl: outputUrl)
        let outcastFrames = try outputFile.readID3Tag().tag.frames

        for frame in outcastFrames {
            // test StringFrame types
            if let isolatedFrame = frame as? OutcastID3.Frame.StringFrame {
                if isolatedFrame.type == AudiobookTag.authors.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Artist Test")
                }
                if isolatedFrame.type == AudiobookTag.bookTitle.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Album Test")
                }
                if isolatedFrame.type == AudiobookTag.category.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Category Test")
                }
                if isolatedFrame.type == AudiobookTag.copyright.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Copyright Test")
                }
                if isolatedFrame.type == AudiobookTag.disc.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "1/2")
                }
                if isolatedFrame.type == AudiobookTag.genre.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Genre Test")
                }
                if isolatedFrame.type == AudiobookTag.keywords.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Keywords Test")
                }
                if isolatedFrame.type == AudiobookTag.mediaType.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "MediaType Test")
                }
                if isolatedFrame.type == AudiobookTag.narrators.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Composer Test")
                }
                if isolatedFrame.type == AudiobookTag.primaryAuthor.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Band Test")
                }
                if isolatedFrame.type == AudiobookTag.publisher.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Publisher Test")
                }
                if isolatedFrame.type == AudiobookTag.releaseDate.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "05/08/1999")
                }
                if isolatedFrame.type == AudiobookTag.series.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "ContentGroupDescription Test")
                }
                if isolatedFrame.type == AudiobookTag.seriesIndex.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "3")
                }
                if isolatedFrame.type == AudiobookTag.seriesTotal.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "4")
                }
                if isolatedFrame.type == AudiobookTag.title.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Title Test")
                }
                if isolatedFrame.type == AudiobookTag.track.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "5/6")
                }
                if isolatedFrame.type == AudiobookTag.universe.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "MovementName Test")
                }
                if isolatedFrame.type == AudiobookTag.universeIndex.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "7")
                }
                if isolatedFrame.type == AudiobookTag.universeTotal.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "8")
                }
            } else if let isolatedFrame = frame as? OutcastID3.Frame.CommentFrame {
                XCTAssertEqual(isolatedFrame.language, "eng")
                XCTAssertEqual(isolatedFrame.commentDescription, "description")
                XCTAssertEqual(isolatedFrame.comment, "Comment Test")
            } else if let isolatedFrame = frame as? OutcastID3.Frame.TranscriptionFrame {
                XCTAssertEqual(isolatedFrame.language, "eng")
                XCTAssertEqual(isolatedFrame.lyricsDescription, "description")
                XCTAssertEqual(isolatedFrame.lyrics, "Lyrics Test")
            }
        }
    }
}
