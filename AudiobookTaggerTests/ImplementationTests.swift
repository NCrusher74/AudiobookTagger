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
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.authors) as! String, "Artist")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.bookTitle) as! String, "Album")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.category) as! String, "PodcastCategory")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.description) as! String, "PodcastDescription")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.disc) as! [Int], [1,3])
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.genre) as! String, "Genre")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.keywords) as! String, "PodcastKeywords")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.mediaType) as! String, "MediaType")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.narrators) as! String, "Composer")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.primaryAuthor) as! String, "AlbumArtist")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.publisher) as! String, "Publisher")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.series) as! String, "ContentGrouping")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.seriesIndex) as! Int, 11)
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.seriesTotal) as! Int, 19)
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.summary) as! String, "UnsyncedLyrics")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.title) as! String, "Title")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.track) as! [Int], [7,8])
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.universe) as! String, "MovementName")
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.universeIndex) as! Int, 6)
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.universeTotal) as! Int, 13)
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.year) as! Int, 2020)
        
        // Test MP4 Reading
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.authors) as! String, "Artist")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.bookTitle) as! String, "Album")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.category) as! String, "Category")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.copyright) as! String, "Copyright")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.description) as! String, "Comment")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.disc) as! [Int], [1,2])
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.genre) as! String, "Genre")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.keywords) as! String, "Keywords")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.mediaType) as! String, "")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.narrators) as! String, "Composer")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.primaryAuthor) as! String, "AlbumArtist")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.publisher) as! String, "Publisher")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.series) as! String, "Grouping")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.seriesIndex) as! Int, 3)
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.seriesTotal) as! Int, 4)
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.summary) as! String, "Lyrics")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.title) as! String, "Title")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.track) as! [Int], [7,8])
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.universe) as! String, "MovementName")
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.universeIndex) as! Int, 5)
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.universeTotal) as! Int, 6)
    }
    
    func testDateFormatting() throws {
        let audiobookFileMP3 = AudiobookFile(from: Bundle.testMp3FullMeta)
        let audiobookFileMP4 = AudiobookFile(from: Bundle.testM4bFullMeta)
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let calendar = Calendar.current
        
        let mp3Date = try audiobookFileMP3.read(tag: AudiobookTag.releaseDate) as? Date
        XCTAssertEqual(mp3Date, formatter.date(from: "01-01-2020"))

        let mp3Day = calendar.component(.day, from: mp3Date ?? Date())
        let mp3Month = calendar.component(.month, from: mp3Date ?? Date())
        let mp3Year = calendar.component(.year, from: mp3Date ?? Date())
        XCTAssertEqual(mp3Day, 01)
        XCTAssertEqual(mp3Month, 01)
        XCTAssertEqual(mp3Year, 2020)
        
        let mp4Date = try audiobookFileMP4.read(tag: AudiobookTag.releaseDate) as? Date
        XCTAssertEqual(mp4Date, formatter.date(from: "01/01/2020"))

        let mp4Day = calendar.component(.day, from: mp4Date ?? Date())
        let mp4Month = calendar.component(.month, from: mp4Date ?? Date())
        let mp4Year = calendar.component(.year, from: mp4Date ?? Date())
        XCTAssertEqual(mp4Day, 01)
        XCTAssertEqual(mp4Month, 01)
        XCTAssertEqual(mp4Year, 2020)
        
        XCTAssertEqual(try audiobookFileMP3.read(tag: AudiobookTag.year) as! Int, 2020)
        XCTAssertEqual(try audiobookFileMP4.read(tag: AudiobookTag.year) as! Int, 2020)
        // this last test is failing "XCTAssertEqual failed: ("0") is not equal to ("2020")"
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
