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
    
    func testMP3AudiobookTag() throws {
        
        let outcastFile = try OutcastID3.MP3File(localUrl: Bundle.testMp3FullMeta)

    }
    
}
/*
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
 
 */
