//
//  ImplementationTests.swift
//  AudiobookTaggerTests
//
//  Created by Nolaine Crusher on 2/29/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import XCTest
import ID3TagEditor
import MP42Foundation

@testable import AudiobookTagger

class ImplementationTests: XCTestCase {
    
    func testMP3AudiobookTag() throws {
        let id3TagEditor = ID3TagEditor()
        if let id3Tag = try id3TagEditor.read(from: Bundle.testMp3FullMeta.path) {
            XCTAssertEqual((id3Tag.frames[AudiobookTag.ChapterTitle.id3tag] as? ID3FrameWithStringContent)?.content, "Title")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.BookTitle.id3tag] as? ID3FrameWithStringContent)?.content, "Album")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Authors.id3tag] as? ID3FrameWithStringContent)?.content, "Artist")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.PrimaryAuthor.id3tag] as? ID3FrameWithStringContent)?.content, "AlbumArtist")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.BriefDescription.id3tag] as? ID3FrameWithStringContent)?.content, "Comment")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Narrators.id3tag] as? ID3FrameWithStringContent)?.content, "Composer")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Series.id3tag] as? ID3FrameWithStringContent)?.content, "ContentGrouping")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Copyright.id3tag] as? ID3FrameWithStringContent)?.content, "Copyright")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.MediaType.id3tag] as? ID3FrameWithStringContent)?.content, "MediaType")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Universe.id3tag] as? ID3FrameWithStringContent)?.content, "MovementName")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Category.id3tag] as? ID3FrameWithStringContent)?.content, "PodcastCategory")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Keywords.id3tag] as? ID3FrameWithStringContent)?.content, "PodcastKeywords")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Publisher.id3tag] as? ID3FrameWithStringContent)?.content, "Publisher")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.FullSummary.id3tag] as? ID3FrameWithStringContent)?.content, "UnsyncedLyrics")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Disc.id3tag] as? ID3FrameDiscPosition)?.position, 1)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Disc.id3tag] as? ID3FrameDiscPosition)?.totalDiscs, 3)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Track.id3tag] as? ID3FrameTrackPosition)?.position, 7)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Track.id3tag] as? ID3FrameTrackPosition)?.totalTracks, 8)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.UniverseIndex.id3tag] as? ID3FrameMovementIndex)?.index, 6)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.UniverseIndex.id3tag] as? ID3FrameMovementIndex)?.totalMovements, 13)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.SeriesIndex.id3tag] as? ID3FrameSeriesIndex)?.index, 11)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.SeriesIndex.id3tag] as? ID3FrameSeriesIndex)?.totalBooks, 19)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Genre.id3tag] as? ID3FrameGenre)?.identifier, nil)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Genre.id3tag] as? ID3FrameGenre)?.description, "Genre")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.ReleaseDate.id3tag] as? ID3FrameRecordingDayMonth)?.day, 01)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.ReleaseDate.id3tag] as? ID3FrameRecordingDayMonth)?.month, 01)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.Year.id3tag] as? ID3FrameRecordingYear)?.year, 2020)
       }
    }
    
    func testMP4AudiobookTag() throws {
        let mp4File = try MP42File(url: URL(fileURLWithPath: Bundle.testM4bFullMeta.path))
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.ChapterTitle.mp4Tag).first?.stringValue, "Title")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.BookTitle.mp4Tag).first?.stringValue, "Album")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.PrimaryAuthor.mp4Tag).first?.stringValue, "AlbumArtist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Authors.mp4Tag).first?.stringValue, "Artist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Series.mp4Tag).first?.stringValue, "Grouping")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Narrators.mp4Tag).first?.stringValue, "Composer")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.BriefDescription.mp4Tag).first?.stringValue, "Comment")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Genre.mp4Tag).first?.stringValue, "Genre")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.ReleaseDate.mp4Tag).first?.stringValue, "01/01/2020")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Track.mp4Tag).first?.arrayValue as! [Int], [7,8])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Disc.mp4Tag).first?.arrayValue as! [Int], [1,2])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.FullSummary.mp4Tag).first?.stringValue, "Lyrics")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Copyright.mp4Tag).first?.stringValue, "Copyright")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Keywords.mp4Tag).first?.stringValue, "Keywords")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Category.mp4Tag).first?.stringValue, "Category")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Publisher.mp4Tag).first?.stringValue, "Publisher")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.Universe.mp4Tag).first?.stringValue, "MovementName")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.UniverseIndex.mp4Tag).first?.numberValue, 5)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.UniverseTotal.mp4Tag).first?.numberValue, 6)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.SeriesIndex.mp4Tag).first?.numberValue, 3)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.SeriesTotal.mp4Tag).first?.numberValue, 4)

    }
    
    
    
}
