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

/* Since it doesn't appear possible to write to a file from a test, I built a separate one-button app and put the command to write these tags in the action, then tested the file by reading it here.*/
class ID3TagEditorTests: XCTestCase {
    
    func testID3StringTagPresence() throws {
        let id3TagEditor = ID3TagEditor()
        if let id3Tag = try id3TagEditor.read(from: Bundle.testMp3FullMeta) {
            XCTAssertNotNil(id3Tag.frames[.Title])
            XCTAssertNotNil(id3Tag.frames[.Artist])
            XCTAssertNotNil(id3Tag.frames[.Album])
            XCTAssertNotNil(id3Tag.frames[.AlbumArtist])
            XCTAssertNotNil(id3Tag.frames[.Comment])
            XCTAssertNotNil(id3Tag.frames[.Composer])
            XCTAssertNotNil(id3Tag.frames[.Conductor])
            XCTAssertNotNil(id3Tag.frames[.ContentGrouping])
            XCTAssertNotNil(id3Tag.frames[.Copyright])
            XCTAssertNotNil(id3Tag.frames[.EncodedBy])
            XCTAssertNotNil(id3Tag.frames[.EncoderSettings])
            XCTAssertNotNil(id3Tag.frames[.FileOwner])
            XCTAssertNotNil(id3Tag.frames[.FileType])
            XCTAssertNotNil(id3Tag.frames[.Grouping])
            XCTAssertNotNil(id3Tag.frames[.Language])
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
            XCTAssertNotNil(id3Tag.frames[.Genre])
            XCTAssertNotNil(id3Tag.frames[.RecordingDayMonth])
            XCTAssertNotNil(id3Tag.frames[.RecordingYear])
        }
    }
    
    
    func testID3TagWriting() throws {
        let id3TagEditor = ID3TagEditor()
        if let id3Tag = try id3TagEditor.read(from: Bundle.testMp3FullMeta) {
            
            XCTAssertEqual((id3Tag.frames[.Title] as? ID3FrameWithStringContent)?.content, "Title TIT2")
            XCTAssertEqual((id3Tag.frames[.Album] as? ID3FrameWithStringContent)?.content, "Album TALB")
            XCTAssertEqual((id3Tag.frames[.Artist] as? ID3FrameWithStringContent)?.content, "Artist TPE1")
            XCTAssertEqual((id3Tag.frames[.AlbumArtist] as? ID3FrameWithStringContent)?.content, "Album Artist TPE2")
            XCTAssertEqual((id3Tag.frames[.Comment] as? ID3FrameWithStringContent)?.content, "This is a short comment. It can be 255 characters and is saved using the frame COMM")
            XCTAssertEqual((id3Tag.frames[.Composer] as? ID3FrameWithStringContent)?.content, "Composer TCOM")
            XCTAssertEqual((id3Tag.frames[.Conductor] as? ID3FrameWithStringContent)?.content, "Conductor TPE3")
            XCTAssertEqual((id3Tag.frames[.ContentGrouping] as? ID3FrameWithStringContent)?.content, "ContentGrouping TIT1")
            XCTAssertEqual((id3Tag.frames[.Copyright] as? ID3FrameWithStringContent)?.content, "Copyright TCOP")
            XCTAssertEqual((id3Tag.frames[.EncodedBy] as? ID3FrameWithStringContent)?.content, "EncodedBy TENC")
            XCTAssertEqual((id3Tag.frames[.EncoderSettings] as? ID3FrameWithStringContent)?.content, "EncoderSettings TSSE")
            XCTAssertEqual((id3Tag.frames[.FileOwner] as? ID3FrameWithStringContent)?.content, "FileOwner TOWN")
            XCTAssertEqual((id3Tag.frames[.FileType] as? ID3FrameWithStringContent)?.content, "FileType TFLT")
            XCTAssertEqual((id3Tag.frames[.Grouping] as? ID3FrameWithStringContent)?.content, "Grouping GRP1")
            XCTAssertEqual((id3Tag.frames[.Language] as? ID3FrameWithStringContent)?.content, "Language TLAN")
            XCTAssertEqual((id3Tag.frames[.Lyricist] as? ID3FrameWithStringContent)?.content, "Lyricist TEXT")
            XCTAssertEqual((id3Tag.frames[.MediaType] as? ID3FrameWithStringContent)?.content, "MediaType TMED")
            XCTAssertEqual((id3Tag.frames[.MixArtist] as? ID3FrameWithStringContent)?.content, "MixArtist TPE4")
            XCTAssertEqual((id3Tag.frames[.MovementName] as? ID3FrameWithStringContent)?.content, "MovementName MVNM")
            XCTAssertEqual((id3Tag.frames[.PodcastCategory] as? ID3FrameWithStringContent)?.content, "PodcastCategory TCAT")
            XCTAssertEqual((id3Tag.frames[.PodcastDescription] as? ID3FrameWithStringContent)?.content, "This is a description saved under TDES, and I think it can be up to 255 characters.")
            XCTAssertEqual((id3Tag.frames[.PodcastID] as? ID3FrameWithStringContent)?.content, "PodcastID TGID")
            XCTAssertEqual((id3Tag.frames[.PodcastKeywords] as? ID3FrameWithStringContent)?.content, "PodcastKeywords TKWD")
            XCTAssertEqual((id3Tag.frames[.Publisher] as? ID3FrameWithStringContent)?.content, "Publisher TPUB")
            XCTAssertEqual((id3Tag.frames[.Subtitle] as? ID3FrameWithStringContent)?.content, "Subtitle TIT3")
            XCTAssertEqual((id3Tag.frames[.UnsyncedLyrics] as? ID3FrameWithStringContent)?.content, "This is a long comment saved under the lyrics tag and it can be longer than 255 characters. I hope. USLT")
            XCTAssertEqual((id3Tag.frames[.DiscPosition] as? ID3FrameDiscPosition)?.position, 1)
            XCTAssertEqual((id3Tag.frames[.DiscPosition] as? ID3FrameDiscPosition)?.totalDiscs, 2)
            XCTAssertEqual((id3Tag.frames[.TrackPosition] as? ID3FrameTrackPosition)?.position, 7)
            XCTAssertEqual((id3Tag.frames[.TrackPosition] as? ID3FrameTrackPosition)?.totalTracks, 8)
            XCTAssertEqual((id3Tag.frames[.MovementIndex] as? ID3FrameMovementIndex)?.index, 3)
            XCTAssertEqual((id3Tag.frames[.MovementIndex] as? ID3FrameMovementIndex)?.totalMovements, 4)
            XCTAssertEqual((id3Tag.frames[.SeriesIndex] as? ID3FrameSeriesIndex)?.index, 5)
            XCTAssertEqual((id3Tag.frames[.SeriesIndex] as? ID3FrameSeriesIndex)?.totalBooks, 6)
            XCTAssertEqual((id3Tag.frames[.Genre] as? ID3FrameGenre)?.identifier, nil)
            XCTAssertEqual((id3Tag.frames[.Genre] as? ID3FrameGenre)?.description, "Genre TCON")
            XCTAssertEqual((id3Tag.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.day, 01)
            XCTAssertEqual((id3Tag.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.month, 01)
            XCTAssertEqual((id3Tag.frames[.RecordingYear] as? ID3FrameRecordingYear)?.year, 2020)


        }
    }
    
    
    // Test Write Code
    func testNewFramesV3() {
        let id3TagEditor = ID3TagEditor()
        let pathMp3Generated =  "output file"
        let id3Tag = ID3Tag(
            version: .version3,
            frames: [
                .Composer : ID3FrameWithStringContent(content: "Composer V3"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor V3"),
                .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping V3"),
                .Copyright : ID3FrameWithStringContent(content: "Copyright V3"),
                .DiscPosition : ID3FrameDiscPosition(position: 1, totalDiscs: 3),
                .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy V3"),
                .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings V3"),
                .FileType : ID3FrameWithStringContent(content: "FileType V3"),
                .FileOwner : ID3FrameWithStringContent(content: "FileOwner V3"),
                .Grouping : ID3FrameWithStringContent(content: "ItunesGrouping V3"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist V3"),
                .MediaType : ID3FrameWithStringContent(content: "MediaType V3"),
                .MixArtist : ID3FrameWithStringContent(content: "MixArtist V3"),
                .MovementName : ID3FrameWithStringContent(content: "MovementName V3"),
                .MovementIndex : ID3FrameMovementIndex(index: 6, totalMovements: 13),
                .PodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory V3"),
                .PodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription V3"),
                .PodcastID : ID3FrameWithStringContent(content: "PodcastID V3"),
                .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords V3"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher V3"),
                .SeriesIndex : ID3FrameSeriesIndex(index: 11, totalBooks: 19),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle V3"),
                .UnsyncedLyrics : ID3FrameWithStringContent(content: "UnsyncedLyrics V3"),
            ]
        )
        
        XCTAssertNoThrow(try id3TagEditor.write(
            tag: id3Tag,
            to: "input file",
            andSaveTo: pathMp3Generated
            ))
        
    }
    
    
    
    
    
    
}
