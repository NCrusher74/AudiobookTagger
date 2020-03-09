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
    
    func fixString(string: String) -> String {
        var stringToTrim = string
        stringToTrim.unicodeScalars.removeAll(where: { $0.value < 0x20 })
        return stringToTrim
    }
    
    func id3TagEditorWriting() throws {
        var audiobookFileMP3 = try AudiobookFile(from: Bundle.testMp3NoMeta)
        
        // MARK: create ID3TagEditor frames
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
        
        // write to temp file with ID3TagEditor
        let mp3OutputPath = NSHomeDirectory() + "/audiobookTagger-mp3-testfile.mp3"
        try audiobookFileMP3.write(outputUrl: URL(fileURLWithPath: mp3OutputPath))
    }
    
    
    func testID3TagEditorOutput() throws {
        
        try id3TagEditorWriting()
        // read ID3TagEditor output with OutcastID3
        let outcastFile = try OutcastID3.MP3File(
            localUrl: URL(fileURLWithPath: NSHomeDirectory() + "/audiobookTagger-mp3-testfile.mp3"))
        
        var fixedFrames: [OutcastID3TagFrame] = []
        let outcastFrames = try outcastFile.readID3Tag().tag.frames
        for frame in outcastFrames {
            if let isolatedFrame = frame as? OutcastID3.Frame.StringFrame {
                
                // correct extra characters introduced into frames
                if isolatedFrame.type == AudiobookTag.authors.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Author Write Test")
                    // add corrected frames to Outcast frames array
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.authors.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.bookTitle.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "BookTitle Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.bookTitle.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.category.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Category Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.category.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.copyright.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Copyright Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.copyright.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.disc.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "11/22")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.disc.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.genre.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Genre Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.genre.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.keywords.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Keywords Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.keywords.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.mediaType.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Audiobook")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.mediaType.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.narrators.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Narrator Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.narrators.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.primaryAuthor.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Primary Author Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.primaryAuthor.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.publisher.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Publisher Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.publisher.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.releaseDate.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "05/08/1999")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.releaseDate.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.series.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Series Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.series.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.seriesIndex.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "55")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.seriesIndex.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.seriesTotal.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "66")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.seriesTotal.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.title.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Title Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.title.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.track.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "33/44")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.track.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.universe.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "Universe Write Test")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.universe.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.universeIndex.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "77")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.universeIndex.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
                if isolatedFrame.type == AudiobookTag.universeTotal.outcastType {
                    XCTAssertEqual(fixString(string: isolatedFrame.str), "88")
                    fixedFrames.append(OutcastID3.Frame.StringFrame(
                        type: AudiobookTag.universeTotal.outcastType!,
                        encoding: .utf8,
                        str: fixString(string: isolatedFrame.str)))
                }
            }
        }
        fixedFrames.append(OutcastID3.Frame.CommentFrame(
            encoding: .utf8, language: "eng",
            commentDescription: "commentDescTest",
            comment: "Comment Content Test"))
        fixedFrames.append(OutcastID3.Frame.TranscriptionFrame(
            encoding: .utf8, language: "eng",
            lyricsDescription: "lyricsDescTest",
            lyrics: "Lyrics Content Test"))
        
        // write to final output file with OutcastID3
        let outcastTag = OutcastID3.ID3Tag(
            version: .v2_4,
            frames: fixedFrames
        )
        let outputUrl = URL(fileURLWithPath: NSHomeDirectory() + "/outcast-PassThru-testfile.mp3")
        try outcastFile.writeID3Tag(tag: outcastTag, outputUrl: outputUrl)
    }
    
    func testOutcastOutput() throws {
        // read final output and check for accuracy
        let outcast2File = try OutcastID3.MP3File(
            localUrl: URL(fileURLWithPath: NSHomeDirectory() + "/outcast-PassThru-testfile.mp3"))
        let outcast2Frames = try outcast2File.readID3Tag().tag.frames
        XCTAssertFalse(outcast2Frames.isEmpty, "No frames.")
        for frame in outcast2Frames {
            if let isolatedFrame = frame as? OutcastID3.Frame.StringFrame {
                if isolatedFrame.type == AudiobookTag.authors.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Author Write Test")
                }
                if isolatedFrame.type == AudiobookTag.bookTitle.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "BookTitle Write Test")
                }
                if isolatedFrame.type == AudiobookTag.category.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Category Write Test")
                }
                if isolatedFrame.type == AudiobookTag.copyright.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Copyright Write Test")
                }
                if isolatedFrame.type == AudiobookTag.disc.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "11/22")
                }
                if isolatedFrame.type == AudiobookTag.genre.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Genre Write Test")
                }
                if isolatedFrame.type == AudiobookTag.keywords.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Keywords Write Test")
                }
                if isolatedFrame.type == AudiobookTag.mediaType.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Audiobook")
                }
                if isolatedFrame.type == AudiobookTag.narrators.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Narrator Write Test")
                }
                if isolatedFrame.type == AudiobookTag.primaryAuthor.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Primary Author Write Test")
                }
                if isolatedFrame.type == AudiobookTag.publisher.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Publisher Write Test")
                }
                if isolatedFrame.type == AudiobookTag.releaseDate.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "05/08/1999")
                }
                if isolatedFrame.type == AudiobookTag.series.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Series Write Test")
                }
                if isolatedFrame.type == AudiobookTag.seriesIndex.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "55")
                }
                if isolatedFrame.type == AudiobookTag.seriesTotal.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "66")
                }
                if isolatedFrame.type == AudiobookTag.title.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Title Write Test")
                }
                if isolatedFrame.type == AudiobookTag.track.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "33/44")
                }
                if isolatedFrame.type == AudiobookTag.universe.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "Universe Write Test")
                }
                if isolatedFrame.type == AudiobookTag.universeIndex.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "77")
                }
                if isolatedFrame.type == AudiobookTag.universeTotal.outcastType {
                    XCTAssertEqual(isolatedFrame.str, "88")
                }
            } else if let isolatedFrame = frame as? OutcastID3.Frame.CommentFrame {
                XCTAssertEqual(fixString(string: isolatedFrame.comment), "Comment Content Test")
            } else if let isolatedFrame = frame as? OutcastID3.Frame.TranscriptionFrame {
                XCTAssertEqual(fixString(string: isolatedFrame.lyrics), "Lyrics Content Test")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
