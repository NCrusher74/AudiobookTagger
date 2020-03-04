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
   
    func testReadFunctions() throws {
        let audiobookFileMP3 = AudiobookFile(from: Bundle.testMp3FullMeta)
        let audiobookFileMP4 = AudiobookFile(from: Bundle.testM4bFullMeta)
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

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateStyle = .short
        let calendar = Calendar.current
        
        let mp3Date = try audiobookFileMP3.releaseDate()
        XCTAssertEqual(mp3Date, formatter.date(from: "01-01-2020"))
        XCTAssertEqual(calendar.component(.day, from: mp3Date), 31)
        XCTAssertEqual(calendar.component(.month, from: mp3Date), 12)
        XCTAssertEqual(calendar.component(.year, from: mp3Date), 2019)

        let mp4Date = try audiobookFileMP4.releaseDate()
        XCTAssertEqual(mp4Date, formatter.date(from: "01/01/2020"))
        
        let mp4Day = calendar.component(.day, from: mp4Date)
        let mp4Month = calendar.component(.month, from: mp4Date)
        let mp4Year = calendar.component(.year, from: mp4Date)
        XCTAssertEqual(mp4Day, 31)
        XCTAssertEqual(mp4Month, 12)
        XCTAssertEqual(mp4Year, 2019)
        
        XCTAssertEqual(try audiobookFileMP3.year(), 2020)
        XCTAssertEqual(try audiobookFileMP4.year(), 2019)
        
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
            XCTAssertEqual((id3Tag.frames[AudiobookTag.releaseDate.id3Tag] as? ID3FrameRecordingDayMonth)?.day, 01)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.releaseDate.id3Tag] as? ID3FrameRecordingDayMonth)?.month, 01)
            XCTAssertEqual((id3Tag.frames[AudiobookTag.year.id3Tag] as? ID3FrameRecordingYear)?.year, 2020)
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

        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateStyle = .short
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: AudiobookTag.releaseDate.mp4Tag).first?.dateValue, formatter.date(from: "01/01/2020"))
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
