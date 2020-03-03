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
    
    func testID3StringTagPresence() throws {
        let id3TagEditor = ID3TagEditor()
        if let id3Tag = try id3TagEditor.read(from: Bundle.testMp3FullMeta.path) {
            XCTAssertNotNil(id3Tag.frames[.Title])
            XCTAssertNotNil(id3Tag.frames[.Artist])
            XCTAssertNotNil(id3Tag.frames[.Album])
            XCTAssertNotNil(id3Tag.frames[.AlbumArtist])
            XCTAssertNotNil(id3Tag.frames[.Composer])
            XCTAssertNotNil(id3Tag.frames[.Conductor])
            XCTAssertNotNil(id3Tag.frames[.ContentGrouping])
            XCTAssertNotNil(id3Tag.frames[.Copyright])
            XCTAssertNotNil(id3Tag.frames[.EncodedBy])
            XCTAssertNotNil(id3Tag.frames[.EncoderSettings])
            XCTAssertNotNil(id3Tag.frames[.FileOwner])
            XCTAssertNotNil(id3Tag.frames[.FileType])
            XCTAssertNotNil(id3Tag.frames[.ITunesGrouping])
            XCTAssertNotNil(id3Tag.frames[.Lyricist])
            XCTAssertNotNil(id3Tag.frames[.MediaType])
            XCTAssertNotNil(id3Tag.frames[.MixArtist])
            XCTAssertNotNil(id3Tag.frames[.MovementName])
            XCTAssertNotNil(id3Tag.frames[.PodcastCategory])
            XCTAssertNotNil(id3Tag.frames[.PodcastDescription])
            XCTAssertNotNil(id3Tag.frames[.PodcastID])
            XCTAssertNotNil(id3Tag.frames[.PodcastKeywords])
            XCTAssertNotNil(id3Tag.frames[.Publisher])
            XCTAssertNotNil(id3Tag.frames[.Subtitle])
            XCTAssertNotNil(id3Tag.frames[.UnsyncedLyrics])
            XCTAssertNotNil(id3Tag.frames[.TrackPosition])
            XCTAssertNotNil(id3Tag.frames[.DiscPosition])
            XCTAssertNotNil(id3Tag.frames[.SeriesIndex])
            XCTAssertNotNil(id3Tag.frames[.MovementIndex])
            XCTAssertNotNil(id3Tag.frames[.SeriesCount])
            XCTAssertNotNil(id3Tag.frames[.MovementCount])
            XCTAssertNotNil(id3Tag.frames[.Genre])
            XCTAssertNotNil(id3Tag.frames[.RecordingDayMonth])
            XCTAssertNotNil(id3Tag.frames[.RecordingYear])
        }
    }
    
    
    func testID3TagWriting() throws {
        let id3TagEditor = ID3TagEditor()
        if let id3Tag = try id3TagEditor.read(from: Bundle.testMp3FullMeta.path) {
            
            XCTAssertEqual((id3Tag.frames[.Title] as? ID3FrameWithStringContent)?.content, "Title")
            XCTAssertEqual((id3Tag.frames[.Album] as? ID3FrameWithStringContent)?.content, "Album")
            XCTAssertEqual((id3Tag.frames[.Artist] as? ID3FrameWithStringContent)?.content, "Artist")
            XCTAssertEqual((id3Tag.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content, "AlbumArtist")
            XCTAssertEqual((id3Tag.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer")
            XCTAssertEqual((id3Tag.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor")
            XCTAssertEqual((id3Tag.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping")
            XCTAssertEqual((id3Tag.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright")
            XCTAssertEqual((id3Tag.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy")
            XCTAssertEqual((id3Tag.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings")
            XCTAssertEqual((id3Tag.frames[.FileOwner] as? ID3FrameWithStringContent)?.content, "FileOwner")
            XCTAssertEqual((id3Tag.frames[.FileType] as? ID3FrameWithStringContent)?.content, "FileType")
            XCTAssertEqual((id3Tag.frames[.ITunesGrouping] as? ID3FrameWithStringContent)?.content, "Grouping")
            XCTAssertEqual((id3Tag.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist")
            XCTAssertEqual((id3Tag.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "MediaType")
            XCTAssertEqual((id3Tag.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist")
            XCTAssertEqual((id3Tag.frames[.MovementName] as? ID3FrameWithStringContent)?.content, "MovementName")
            XCTAssertEqual((id3Tag.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory")
            XCTAssertEqual((id3Tag.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.content, "PodcastDescription")
            XCTAssertEqual((id3Tag.frames[.PodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID")
            XCTAssertEqual((id3Tag.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords")
            XCTAssertEqual((id3Tag.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher")
            XCTAssertEqual((id3Tag.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle")
            XCTAssertEqual((id3Tag.frames[.UnsyncedLyrics] as? ID3FrameWithStringContent)?.content, "UnsyncedLyrics")
            XCTAssertEqual((id3Tag.frames[.DiscPosition] as? ID3FramePartOfTotal)?.part, 1)
            XCTAssertEqual((id3Tag.frames[.DiscPosition] as? ID3FramePartOfTotal)?.total, 3)
            XCTAssertEqual((id3Tag.frames[.TrackPosition] as? ID3FramePartOfTotal)?.part, 7)
            XCTAssertEqual((id3Tag.frames[.TrackPosition] as? ID3FramePartOfTotal)?.total, 8)
            XCTAssertEqual((id3Tag.frames[.MovementIndex] as? ID3FrameWithIntegerContent)?.value, 6)
            XCTAssertEqual((id3Tag.frames[.MovementCount] as? ID3FrameWithIntegerContent)?.value, 13)
            XCTAssertEqual((id3Tag.frames[.SeriesIndex] as? ID3FrameWithIntegerContent)?.value, 11)
            XCTAssertEqual((id3Tag.frames[.SeriesCount] as? ID3FrameWithIntegerContent)?.value, 19)
            XCTAssertEqual((id3Tag.frames[.Genre] as? ID3FrameGenre)?.identifier, nil)
            XCTAssertEqual((id3Tag.frames[.Genre] as? ID3FrameGenre)?.description, "Genre")
            XCTAssertEqual((id3Tag.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.day, 01)
            XCTAssertEqual((id3Tag.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.month, 01)
            XCTAssertEqual((id3Tag.frames[.RecordingYear] as? ID3FrameRecordingYear)?.year, 2020)
        }
    }
    
    // Test Write Code
    func testID3Writing() {
        let id3TagEditor = ID3TagEditor()
        let pathMp3Generated = "/Users/nolainecrusher/Downloads/audiobook_tools/sampleaax/test/_testfile.mp3"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Artist : ID3FrameWithStringContent(content: "Artist"),
                .Album : ID3FrameWithStringContent(content: "Album"),
                .Title : ID3FrameWithStringContent(content: "Title"),
                .AlbumArtist : ID3FrameWithStringContent(content: "AlbumArtist"),
                .Genre : ID3FrameGenre(genre: nil, description: "Genre"),
                .Composer : ID3FrameWithStringContent(content: "Composer"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright"),
                .DiscPosition : ID3FramePartOfTotal(part: 1, total: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings"),
                .FileType : ID3FrameWithStringContent(content: "FileType"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner"),
                .ITunesGrouping : ID3FrameWithStringContent(content: "Grouping"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist"),
                .MediaType : ID3FrameWithStringContent(content: "MediaType"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist"),
                .MovementName : ID3FrameWithStringContent(content: "MovementName"),
                .MovementIndex : ID3FrameWithIntegerContent(value: 6),
                .MovementCount : ID3FrameWithIntegerContent(value: 13),
                .SeriesIndex : ID3FrameWithIntegerContent(value: 11),
                .SeriesCount : ID3FrameWithIntegerContent(value: 19),
                .PodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory"),
                .PodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription"),
                .PodcastID : ID3FrameWithStringContent(content: "PodcastID"),
                .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher"),
                .RecordingDayMonth : ID3FrameRecordingDayMonth(day: 01, month: 01),
                .RecordingYear : ID3FrameRecordingYear(year: 2020),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle"),
                .TrackPosition : ID3FramePartOfTotal(part: 7, total: 8),
                .UnsyncedLyrics : ID3FrameWithStringContent(content: "UnsyncedLyrics"),
            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: Bundle.testMp3NoMeta.path,
            andSaveTo: pathMp3Generated
            ))
    }
    
}
