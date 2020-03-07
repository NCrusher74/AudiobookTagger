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

    func testDate() throws {
        XCTAssertEqual(Date(us: "01/01/1970"), Date(timeIntervalSince1970: 0))
    }

    func testWriteFunctions() throws {
        var audiobookFileMP3 = try AudiobookFile(from: Bundle.testMp3NoMeta)
        var audiobookFileMP4 = try AudiobookFile(from: Bundle.testM4bNoMeta)

        let date = Date(us: "05/08/1999")
        
        try audiobookFileMP3.setAuthors(authors: "Author Write Test")
        try audiobookFileMP3.setBookTitle(bookTitle: "BookTitle Write Test")
        try audiobookFileMP3.setNarrators(narrators: "Narrators Write Test")
        try audiobookFileMP3.setGenre(genre: "Genre Write Test")
        try audiobookFileMP3.setTitle(title: "Title Write Test")
        try audiobookFileMP3.setSeries(series: "Series Write Test")
        try audiobookFileMP3.setSummary(summary: "Summary Write Test")
        try audiobookFileMP3.setCategory(category: "Category Write Test")
        try audiobookFileMP3.setKeywords(keywords: "Keywords Write Test")
        try audiobookFileMP3.setUniverse(universe: "Universe Write Test")
        try audiobookFileMP3.setCopyright(copyright: "Copyright Write Test")
        try audiobookFileMP3.setMediaType(mediaType: "Audiobook")
        try audiobookFileMP3.setPublisher(publisher: "Publisher Write Test")
        try audiobookFileMP3.setDescription(description: "Description Write Test")
        try audiobookFileMP3.setPrimaryAuthor(primaryAuthor: "Primary Author Write Test")
        try audiobookFileMP3.setDisc(disc: [11,22])
        try audiobookFileMP3.setTrack(track: [33,44])
        try audiobookFileMP3.set(releaseDate: date)
        try audiobookFileMP3.setSeriesIndex(index: 55)
        try audiobookFileMP3.setSeriesTotal(total: 66)
        try audiobookFileMP3.setUniverseIndex(index: 77)
        try audiobookFileMP3.setUniverseTotal(total: 88)

        try audiobookFileMP4.setAuthors(authors: "Author Write Test")
        try audiobookFileMP4.setBookTitle(bookTitle: "BookTitle Write Test")
        try audiobookFileMP4.setNarrators(narrators: "Narrators Write Test")
        try audiobookFileMP4.setGenre(genre: "Genre Write Test")
        try audiobookFileMP4.setTitle(title: "Title Write Test")
        try audiobookFileMP4.setSeries(series: "Series Write Test")
        try audiobookFileMP4.setSummary(summary: "Summary Write Test")
        try audiobookFileMP4.setCategory(category: "Category Write Test")
        try audiobookFileMP4.setKeywords(keywords: "Keywords Write Test")
        try audiobookFileMP4.setUniverse(universe: "Universe Write Test")
        try audiobookFileMP4.setCopyright(copyright: "Copyright Write Test")
        try audiobookFileMP4.setMediaType(mediaType: "Audiobook")
        try audiobookFileMP4.setPublisher(publisher: "Publisher Write Test")
        try audiobookFileMP4.setDescription(description: "Description Write Test")
        try audiobookFileMP4.setPrimaryAuthor(primaryAuthor: "Primary Author Write Test")
        try audiobookFileMP4.setDisc(disc: [11,22])
        try audiobookFileMP4.setTrack(track: [33,44])
        try audiobookFileMP4.set(releaseDate: date)
        try audiobookFileMP4.setSeriesIndex(index: 55)
        try audiobookFileMP4.setSeriesTotal(total: 66)
        try audiobookFileMP4.setUniverseIndex(index: 77)
        try audiobookFileMP4.setUniverseTotal(total: 88)
        
        let mp3OutputPath = NSHomeDirectory() + "/audiobookTagger-mp3-testfile.mp3"
        let mp4OutputPath = NSHomeDirectory() + "/audiobookTagger-mp4-testfile.m4b"
        try audiobookFileMP3.write(outputUrl: URL(fileURLWithPath: mp3OutputPath))
        try audiobookFileMP4.write(outputUrl: URL(fileURLWithPath: mp4OutputPath))
        
        XCTAssert(FileManager.default.fileExists(atPath: mp3OutputPath), "MP3 output file could not be found")
        XCTAssert(FileManager.default.fileExists(atPath: mp4OutputPath), "MP4 output file could not be found")
        
        let mp3TestUrl = URL(fileURLWithPath: mp3OutputPath)
        let mp4TestUrl = URL(fileURLWithPath: mp4OutputPath)
        
        let testMP3 = try AudiobookFile(from: mp3TestUrl)
        let testMP4 = try AudiobookFile(from: mp4TestUrl)
        
        XCTAssertEqual(try testMP3.authors(), "Author Write Test")
        XCTAssertEqual(try testMP4.authors(), "Author Write Test")
        XCTAssertEqual(try testMP3.bookTitle(), "BookTitle Write Test")
        XCTAssertEqual(try testMP4.bookTitle(), "BookTitle Write Test")
        XCTAssertEqual(try testMP3.category(), "Category Write Test")
        XCTAssertEqual(try testMP4.category(), "Category Write Test")
        XCTAssertEqual(try testMP3.copyright(), "Copyright Write Test")
        XCTAssertEqual(try testMP4.copyright(), "Copyright Write Test")
        XCTAssertEqual(try testMP3.description(), "Description Write Test")
        XCTAssertEqual(try testMP4.description(), "Description Write Test")
        XCTAssertEqual(try testMP3.disc(), [11,22])
        XCTAssertEqual(try testMP4.disc(), [11,22])
        XCTAssertEqual(try testMP3.genre(), "Genre Write Test")
        XCTAssertEqual(try testMP4.genre(), "Genre Write Test")
        XCTAssertEqual(try testMP3.keywords(), "Keywords Write Test")
        XCTAssertEqual(try testMP4.keywords(), "Keywords Write Test")
        XCTAssertEqual(try testMP3.mediaType(), "Audiobook")
        XCTAssertEqual(try testMP4.mediaType(), "Audiobook")
        XCTAssertEqual(try testMP3.narrators(), "Narrators Write Test")
        XCTAssertEqual(try testMP4.narrators(), "Narrators Write Test")
        XCTAssertEqual(try testMP3.primaryAuthor(), "Primary Author Write Test")
        XCTAssertEqual(try testMP4.primaryAuthor(), "Primary Author Write Test")
        XCTAssertEqual(try testMP3.publisher(), "Publisher Write Test")
        XCTAssertEqual(try testMP4.publisher(), "Publisher Write Test")

        let mp3Date = try XCTUnwrap(testMP3.releaseDate())
        XCTAssertEqual(mp3Date, date)
        let mp4Date = try XCTUnwrap(testMP4.releaseDate())
        XCTAssertEqual(mp4Date, date)

        XCTAssertEqual(try testMP3.series(), "Series Write Test")
        XCTAssertEqual(try testMP4.series(), "Series Write Test")
        XCTAssertEqual(try testMP3.seriesIndex(), 55)
        XCTAssertEqual(try testMP4.seriesIndex(), 55)
        XCTAssertEqual(try testMP3.seriesTotal(), 66)
        XCTAssertEqual(try testMP4.seriesTotal(), 66)
        XCTAssertEqual(try testMP3.universe(), "Universe Write Test")
        XCTAssertEqual(try testMP4.universe(), "Universe Write Test")
        XCTAssertEqual(try testMP3.universeIndex(), 77)
        XCTAssertEqual(try testMP4.universeIndex(), 77)
        XCTAssertEqual(try testMP3.universeTotal(), 88)
        XCTAssertEqual(try testMP4.universeTotal(), 88)

        XCTAssertEqual(try testMP3.summary(), "Summary Write Test")
        XCTAssertEqual(try testMP4.summary(), "Summary Write Test")
        XCTAssertEqual(try testMP3.title(), "Title Write Test")
        XCTAssertEqual(try testMP4.title(), "Title Write Test")
        XCTAssertEqual(try testMP3.track(), [33,44])
        XCTAssertEqual(try testMP4.track(), [33,44])

    }
    
    func testReadFunctions() throws {
        let audiobookFileMP3 = try AudiobookFile(from: Bundle.testMp3FullMeta)
        let audiobookFileMP4 = try AudiobookFile(from: Bundle.testM4bFullMeta)
        // Test MP3 Reading
        XCTAssertEqual(try audiobookFileMP3.authors(), "Artist")
        XCTAssertEqual(try audiobookFileMP3.bookTitle(), "Album")
        XCTAssertEqual(try audiobookFileMP3.category(), "PodcastCategory")
        XCTAssertEqual(try audiobookFileMP3.copyright(), "Copyright")
        XCTAssertEqual(try audiobookFileMP3.description(), "PodcastDescription")
        XCTAssertEqual(try audiobookFileMP3.disc(), [1,3])
        XCTAssertEqual(try audiobookFileMP3.genre(), "Genre")
        XCTAssertEqual(try audiobookFileMP3.keywords(), "PodcastKeywords")
        XCTAssertEqual(try audiobookFileMP3.mediaType(), "MediaType")
        XCTAssertEqual(try audiobookFileMP3.narrators(), "Composer")
        XCTAssertEqual(try audiobookFileMP3.primaryAuthor(), "AlbumArtist")
        XCTAssertEqual(try audiobookFileMP3.publisher(), "Publisher")
        XCTAssertEqual(try audiobookFileMP3.series(), "ContentGrouping")
        XCTAssertEqual(try audiobookFileMP3.seriesIndex(), 11)
        XCTAssertEqual(try audiobookFileMP3.seriesTotal(), 19)
        XCTAssertEqual(try audiobookFileMP3.summary(), "UnsyncedLyrics")
        XCTAssertEqual(try audiobookFileMP3.title(), "Title")
        XCTAssertEqual(try audiobookFileMP3.track(), [7,8])
        XCTAssertEqual(try audiobookFileMP3.universe(), "MovementName")
        XCTAssertEqual(try audiobookFileMP3.universeIndex(), 6)
        XCTAssertEqual(try audiobookFileMP3.universeTotal(), 13)

        // Test MP4 Reading
        XCTAssertEqual(try audiobookFileMP4.authors(), "Artist")
        XCTAssertEqual(try audiobookFileMP4.bookTitle(), "Album")
        XCTAssertEqual(try audiobookFileMP4.category(), "Category")
        XCTAssertEqual(try audiobookFileMP4.copyright(), "Copyright")
        XCTAssertEqual(try audiobookFileMP4.description(), "Comment")
        XCTAssertEqual(try audiobookFileMP4.disc(), [1,2])
        XCTAssertEqual(try audiobookFileMP4.genre(), "Genre")
        XCTAssertEqual(try audiobookFileMP4.keywords(), "Keywords")
        XCTAssertEqual(try audiobookFileMP4.mediaType(), "")
        XCTAssertEqual(try audiobookFileMP4.narrators(), "Composer")
        XCTAssertEqual(try audiobookFileMP4.primaryAuthor(), "AlbumArtist")
        XCTAssertEqual(try audiobookFileMP4.publisher(), "Publisher")
        XCTAssertEqual(try audiobookFileMP4.series(), "Grouping")
        XCTAssertEqual(try audiobookFileMP4.seriesIndex(), 3)
        XCTAssertEqual(try audiobookFileMP4.seriesTotal(), 4)
        XCTAssertEqual(try audiobookFileMP4.summary(), "Lyrics")
        XCTAssertEqual(try audiobookFileMP4.title(), "Title")
        XCTAssertEqual(try audiobookFileMP4.track(), [7,8])
        XCTAssertEqual(try audiobookFileMP4.universe(), "MovementName")
        XCTAssertEqual(try audiobookFileMP4.universeIndex(), 5)
        XCTAssertEqual(try audiobookFileMP4.universeTotal(), 6)
        
        let mp3Date = try XCTUnwrap(audiobookFileMP3.releaseDate())
        XCTAssertEqual(mp3Date, Date(us: "01/01/2020"))

        let mp4Date = try XCTUnwrap(audiobookFileMP4.releaseDate())
        XCTAssertEqual(mp4Date, Date(us: "01/01/2020"))
    }
    
    func testMP3AudiobookTag() throws {
        let id3TagEditor = ID3TagEditor()
        if let id3Tag = try id3TagEditor.read(from: Bundle.testMp3FullMeta.path) {
            XCTAssertEqual((id3Tag.frames[AudiobookTag.title.id3Tag] as? ID3FrameWithStringContent)?.content, "Title")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.bookTitle.id3Tag] as? ID3FrameWithStringContent)?.content, "Album")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.authors.id3Tag] as? ID3FrameWithStringContent)?.content, "Artist")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.primaryAuthor.id3Tag] as? ID3FrameWithStringContent)?.content, "AlbumArtist")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.description.id3Tag] as? ID3FrameWithStringContent)?.content, "PodcastDescription")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.narrators.id3Tag] as? ID3FrameWithStringContent)?.content, "Composer")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.series.id3Tag] as? ID3FrameWithStringContent)?.content, "ContentGrouping")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.copyright.id3Tag] as? ID3FrameWithStringContent)?.content, "Copyright")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.mediaType.id3Tag] as? ID3FrameWithStringContent)?.content, "MediaType")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.universe.id3Tag] as? ID3FrameWithStringContent)?.content, "MovementName")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.category.id3Tag] as? ID3FrameWithStringContent)?.content, "PodcastCategory")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.keywords.id3Tag] as? ID3FrameWithStringContent)?.content, "PodcastKeywords")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.publisher.id3Tag] as? ID3FrameWithStringContent)?.content, "Publisher")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.summary.id3Tag] as? ID3FrameWithStringContent)?.content, "UnsyncedLyrics")
            XCTAssertEqual((id3Tag.frames[AudiobookTag.disc.id3Tag] as? ID3FramePartOfTotal)?.part, 1)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.disc.id3Tag] as? ID3FramePartOfTotal)?.total, 3)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.track.id3Tag] as? ID3FramePartOfTotal)?.part, 7)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.track.id3Tag] as? ID3FramePartOfTotal)?.total, 8)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.universeIndex.id3Tag] as? ID3FrameWithIntegerContent)?.value, 6)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.universeTotal.id3Tag] as? ID3FrameWithIntegerContent)?.value, 13)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.seriesIndex.id3Tag] as? ID3FrameWithIntegerContent)?.value, 11)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.seriesTotal.id3Tag] as? ID3FrameWithIntegerContent)?.value, 19)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.genre.id3Tag] as? ID3FrameGenre)?.identifier, nil)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.genre.id3Tag] as? ID3FrameGenre)?.description, "Genre")
            XCTAssertEqual((id3Tag.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.day, 01)
            XCTAssertEqual((id3Tag.frames[.RecordingDayMonth] as? ID3FrameRecordingDayMonth)?.month, 01)
       }
    }
    
    func testMP4AudiobookTag() throws {
        let mp4File = try MP42File(url: URL(fileURLWithPath: Bundle.testM4bFullMeta.path))
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.title.mp4Tag).first?.stringValue, "Title")
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
            byIdentifier: AudiobookTag.description.mp4Tag).first?.stringValue, "Comment")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.genre.mp4Tag).first?.stringValue, "Genre")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
          byIdentifier: AudiobookTag.releaseDate.mp4Tag).first?.dateValue, Date(us: "01/01/2020"))
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.track.mp4Tag).first?.arrayValue as! [Int], [7,8])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.disc.mp4Tag).first?.arrayValue as! [Int], [1,2])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.summary.mp4Tag).first?.stringValue, "Lyrics")
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
            byIdentifier: AudiobookTag.seriesIndex.mp4Tag).first?.numberValue, 3)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.universeTotal.mp4Tag).first?.numberValue, 6)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.seriesTotal.mp4Tag).first?.numberValue, 4)
    }
}
