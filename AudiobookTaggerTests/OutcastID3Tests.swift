//
//  OutcastID3Tests.swift
//  AudiobookTaggerTests
//
//  Created by Nolaine Crusher on 3/7/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import XCTest
import OutcastID3
import ID3TagEditor
@testable import AudiobookTagger

class OutcastID3Tests: XCTestCase {
    
    func testCharacterRemoval() throws {
        func fixString(stringToFix: String) -> String {
            var stringToTrim = stringToFix.unicodeScalars.map({ $0.value })
            let bytesToRemove: [UInt32] = [0,3]
            
            for byte in bytesToRemove {
                for (index, value) in stringToTrim.enumerated() {
                    if value == byte && stringToTrim.contains(byte) {
                        stringToTrim.remove(at: index)
                    }
                }
            }
            let trimmedString = String(codeUnits: stringToTrim, codec : UTF32())!
            return trimmedString
        }
        
        let outputFile = try OutcastID3.MP3File(localUrl: Bundle.testMp3FullMeta)
        let outcastFrames = try outputFile.readID3Tag().tag.frames
        
        for frame in outcastFrames {
            if let isolatedFrame = frame as? OutcastID3.Frame.StringFrame {
                if isolatedFrame.type == AudiobookTag.authors.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Artist")
                }
            }
        }
        
    }
    
    func testTwoStageWriting() throws {
        
        func fixString(stringToFix: String) -> String {
            var stringToTrim = stringToFix.unicodeScalars.map({ $0.value })
            let bytesToRemove: [UInt32] = [0,3]
            
            for byte in bytesToRemove {
                for (index, value) in stringToTrim.enumerated() {
                    if value == byte && stringToTrim.contains(byte) {
                        stringToTrim.remove(at: index)
                    }
                }
            }
            let trimmedString = String(codeUnits: stringToTrim, codec : UTF32())!
            return trimmedString
        }
        var audiobookFileMP3 = try AudiobookFile(from: Bundle.testMp3NoMeta)
        
        let date = Date(us: "05/08/1999")
        
        try audiobookFileMP3.setAuthors(authors: "Author Write Test")
        try audiobookFileMP3.setBookTitle(bookTitle: "BookTitle Write Test")
        try audiobookFileMP3.setNarrators(narrators: "Narrator Write Test")
        try audiobookFileMP3.setGenre(genre: "Genre Write Test")
        try audiobookFileMP3.setTitle(title: "Title Write Test")
        try audiobookFileMP3.setSeries(series: "Series Write Test")
        try audiobookFileMP3.setSummary(summary: "")
        try audiobookFileMP3.setCategory(category: "Category Write Test")
        try audiobookFileMP3.setKeywords(keywords: "Keywords Write Test")
        try audiobookFileMP3.setUniverse(universe: "Universe Write Test")
        try audiobookFileMP3.setCopyright(copyright: "Copyright Write Test")
        try audiobookFileMP3.setMediaType(mediaType: "Audiobook")
        try audiobookFileMP3.setPublisher(publisher: "Publisher Write Test")
        try audiobookFileMP3.setDescription(description: "")
        try audiobookFileMP3.setPrimaryAuthor(primaryAuthor: "Primary Author Write Test")
        try audiobookFileMP3.setDisc(disc: [11,22])
        try audiobookFileMP3.setTrack(track: [33,44])
        try audiobookFileMP3.set(releaseDate: date)
        try audiobookFileMP3.setSeriesIndex(index: 55)
        try audiobookFileMP3.setSeriesTotal(total: 66)
        try audiobookFileMP3.setUniverseIndex(index: 77)
        try audiobookFileMP3.setUniverseTotal(total: 88)
        
        let mp3OutputPath = NSHomeDirectory() + "/audiobookTagger-mp3-testfile.mp3"
        try audiobookFileMP3.write(outputUrl: URL(fileURLWithPath: mp3OutputPath))
        
        let outcastFile = try OutcastID3.MP3File(localUrl: URL(fileURLWithPath: mp3OutputPath))
        let outcastFrames = try outcastFile.readID3Tag().tag.frames
        var authorStore: OutcastID3TagFrame?
        var bookTitleStore: OutcastID3TagFrame?
        var categoryStore: OutcastID3TagFrame?
        var copyrightStore: OutcastID3TagFrame?
        var discStore: OutcastID3TagFrame?
        var genreStore: OutcastID3TagFrame?
        var keywordsStore: OutcastID3TagFrame?
        var mediaTypeStore: OutcastID3TagFrame?
        var narratorStore: OutcastID3TagFrame?
        var primaryAuthorStore: OutcastID3TagFrame?
        var publisherStore: OutcastID3TagFrame?
        var releaseDateStore: OutcastID3TagFrame?
        var seriesNameStore: OutcastID3TagFrame?
        var seriesIndexStore: OutcastID3TagFrame?
        var seriesTotalStore: OutcastID3TagFrame?
        var titleStore: OutcastID3TagFrame?
        var trackStore: OutcastID3TagFrame?
        var universeStore: OutcastID3TagFrame?
        var universeIndexStore: OutcastID3TagFrame?
        var universeTotalStore: OutcastID3TagFrame?
        for frame in outcastFrames {
            if let isolatedFrame = frame as? OutcastID3.Frame.StringFrame {
                if isolatedFrame.type == AudiobookTag.authors.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Author Write Test")
                    authorStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.bookTitle.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "BookTitle Write Test")
                    bookTitleStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.category.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Category Write Test")
                    categoryStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.copyright.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Copyright Write Test")
                    copyrightStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.disc.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "11/22")
                    discStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.genre.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Genre Write Test")
                    genreStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.keywords.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Keywords Write Test")
                    keywordsStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.mediaType.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Audiobook")
                    mediaTypeStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.narrators.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Narrator Write Test")
                    narratorStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.primaryAuthor.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Primary Author Write Test")
                    primaryAuthorStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.publisher.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Publisher Write Test")
                    publisherStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.releaseDate.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "05/08/1999")
                    releaseDateStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.series.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Series Write Test")
                    seriesNameStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.seriesIndex.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "55")
                    seriesIndexStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.seriesTotal.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "66")
                    seriesTotalStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.title.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Title Write Test")
                    titleStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.track.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "33/44")
                    trackStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.universe.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Universe Write Test")
                    universeStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.universeIndex.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "77")
                    universeIndexStore = isolatedFrame
                }
                if isolatedFrame.type == AudiobookTag.universeTotal.outcastType {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "88")
                    universeTotalStore = isolatedFrame
                }
            }
            let commentStore = OutcastID3.Frame.CommentFrame(
                encoding: .utf8, language: "eng",
                commentDescription: "commentDescTest",
                comment: "Comment Content Test")
            let summaryStore = OutcastID3.Frame.TranscriptionFrame(
                encoding: .utf8, language: "eng",
                lyricsDescription: "lyricsDescTest",
                lyrics: "Lyrics Content Test")
            
            let outcastOutputFrames: [OutcastID3TagFrame] = [
                authorStore!,
                bookTitleStore!,
                categoryStore!,
                copyrightStore!,
                discStore!,
                genreStore!,
                keywordsStore!,
                mediaTypeStore!,
                narratorStore!,
                primaryAuthorStore!,
                publisherStore!,
                releaseDateStore!,
                seriesNameStore!,
                seriesIndexStore!,
                seriesTotalStore!,
                titleStore!,
                trackStore!,
                universeStore!,
                universeIndexStore!,
                universeTotalStore!,
                commentStore,
                summaryStore
            ]
            let outcastTag = OutcastID3.ID3Tag(
                version: .v2_4,
                frames: outcastOutputFrames
            )
            let outputUrl = URL(fileURLWithPath: NSHomeDirectory() + "/outcast-PassThru-testfile.mp3")
            try outcastFile.writeID3Tag(tag: outcastTag, outputUrl: outputUrl)
            
            let outcast2File = try OutcastID3.MP3File(localUrl: outputUrl)
            let outcast2Frames = try outcast2File.readID3Tag().tag.frames
            for frame in outcast2Frames {
                if let isolatedFrame = frame as? OutcastID3.Frame.StringFrame {
                    if isolatedFrame.type == AudiobookTag.authors.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Author Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.bookTitle.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "BookTitle Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.category.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Category Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.copyright.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Copyright Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.disc.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "11/22")
                    }
                    if isolatedFrame.type == AudiobookTag.genre.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Genre Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.keywords.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Keywords Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.mediaType.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Audiobook")
                    }
                    if isolatedFrame.type == AudiobookTag.narrators.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Narrator Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.primaryAuthor.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Primary Author Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.publisher.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Publisher Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.releaseDate.outcastType {
                        XCTAssertEqual(isolatedFrame.str, "05/08/1999")
                    }
                    if isolatedFrame.type == AudiobookTag.series.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Series Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.seriesIndex.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "55")
                    }
                    if isolatedFrame.type == AudiobookTag.seriesTotal.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "66")
                    }
                    if isolatedFrame.type == AudiobookTag.title.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Title Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.track.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "33/44")
                    }
                    if isolatedFrame.type == AudiobookTag.universe.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "Universe Write Test")
                    }
                    if isolatedFrame.type == AudiobookTag.universeIndex.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "77")
                    }
                    if isolatedFrame.type == AudiobookTag.universeTotal.outcastType {
                        XCTAssertEqual(fixString(stringToFix: isolatedFrame.str), "88")
                    }
                } else if let isolatedFrame = frame as? OutcastID3.Frame.CommentFrame {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.comment), "Comment Content Test")
                } else if let isolatedFrame = frame as? OutcastID3.Frame.TranscriptionFrame {
                    XCTAssertEqual(fixString(stringToFix: isolatedFrame.lyrics), "Lyrics Content Test")
                }
            }
        }
    }
    
    
}
