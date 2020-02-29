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
   
    func testReadID3Function() throws {

    }
    
    func testMP3AudiobookTag() throws {
        let id3TagEditor = ID3TagEditor()
        if let id3Tag = try id3TagEditor.read(from: Bundle.testMp3FullMeta.path) {
            XCTAssertEqual((id3Tag.frames[AudiobookTag.chapterTitle.id3Tag] as? ID3FrameWithStringContent)?.content, "Title")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.bookTitle.id3Tag] as? ID3FrameWithStringContent)?.content, "Album")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.authors.id3Tag] as? ID3FrameWithStringContent)?.content, "Artist")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.primaryAuthor.id3Tag] as? ID3FrameWithStringContent)?.content, "AlbumArtist")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.briefDescription.id3Tag] as? ID3FrameWithStringContent)?.content, "Comment")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.narrators.id3Tag] as? ID3FrameWithStringContent)?.content, "Composer")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.series.id3Tag] as? ID3FrameWithStringContent)?.content, "ContentGrouping")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.copyright.id3Tag] as? ID3FrameWithStringContent)?.content, "Copyright")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.mediaType.id3Tag] as? ID3FrameWithStringContent)?.content, "MediaType")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.universe.id3Tag] as? ID3FrameWithStringContent)?.content, "MovementName")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.category.id3Tag] as? ID3FrameWithStringContent)?.content, "PodcastCategory")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.keywords.id3Tag] as? ID3FrameWithStringContent)?.content, "PodcastKeywords")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.publisher.id3Tag] as? ID3FrameWithStringContent)?.content, "Publisher")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.fullSummary.id3Tag] as? ID3FrameWithStringContent)?.content, "UnsyncedLyrics")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.disc.id3Tag] as? ID3FrameDiscPosition)?.position, 1)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.disc.id3Tag] as? ID3FrameDiscPosition)?.totalDiscs, 3)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.track.id3Tag] as? ID3FrameTrackPosition)?.position, 7)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.track.id3Tag] as? ID3FrameTrackPosition)?.totalTracks, 8)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.universeIndex.id3Tag] as? ID3FrameMovementIndex)?.index, 6)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.universeIndex.id3Tag] as? ID3FrameMovementIndex)?.totalMovements, 13)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.seriesIndex.id3Tag] as? ID3FrameSeriesIndex)?.index, 11)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.seriesIndex.id3Tag] as? ID3FrameSeriesIndex)?.totalBooks, 19)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.genre.id3Tag] as? ID3FrameGenre)?.identifier, nil)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.genre.id3Tag] as? ID3FrameGenre)?.description, "Genre")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.releaseDate.id3Tag] as? ID3FrameRecordingDayMonth)?.day, 01)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.releaseDate.id3Tag] as? ID3FrameRecordingDayMonth)?.month, 01)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.year.id3Tag] as? ID3FrameRecordingYear)?.year, 2020)
       }
    }
    
    func testMP4AudiobookTag() throws {
        let mp4File = try MP42File(url: URL(fileURLWithPath: Bundle.testM4bFullMeta.path))
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.chapterTitle.mp4Tag).first?.stringValue, "Title")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.bookTitle.mp4Tag).first?.stringValue, "Album")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.primaryAuthor.mp4Tag).first?.stringValue, "AlbumArtist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.authors.mp4Tag).first?.stringValue, "Artist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.series.mp4Tag).first?.stringValue, "Grouping")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.narrators.mp4Tag).first?.stringValue, "Composer")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.briefDescription.mp4Tag).first?.stringValue, "Comment")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.genre.mp4Tag).first?.stringValue, "Genre")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.releaseDate.mp4Tag).first?.stringValue, "01/01/2020")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.track.mp4Tag).first?.arrayValue as! [Int], [7,8])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.disc.mp4Tag).first?.arrayValue as! [Int], [1,2])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.fullSummary.mp4Tag).first?.stringValue, "Lyrics")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.copyright.mp4Tag).first?.stringValue, "Copyright")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.keywords.mp4Tag).first?.stringValue, "Keywords")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.category.mp4Tag).first?.stringValue, "Category")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.publisher.mp4Tag).first?.stringValue, "Publisher")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.universe.mp4Tag).first?.stringValue, "MovementName")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.universeIndex.mp4Tag).first?.numberValue, 5)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.universeTotal.mp4Tag).first?.numberValue, 6)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.seriesIndex.mp4Tag).first?.numberValue, 3)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.seriesTotal.mp4Tag).first?.numberValue, 4)

    }
    
    
    
}
