//
//  MP42FoundationTests.swift
//  AudiobookTaggerTests
//
//  Created by Nolaine Crusher on 2/25/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//
//
import XCTest
import MP42Foundation
@testable import AudiobookTagger

/* Since it doesn't appear possible to write to a file from a test, I built a separate one-button app and put the command to write these tags in the action, then tested the file by reading it here.*/
class MP42FoundationTests: XCTestCase {

    func testAvailableMetadata() throws {
        print(MP42Metadata.availableMetadata)
        print(MP42Metadata.writableMetadata)
        XCTAssert(1 == 1)
    }
    
    func testMP4TagPresence() throws {
        let mp4File = try MP42File(url: URL(fileURLWithPath: Bundle.testM4bNoMeta))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyName))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAlbum))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAlbumArtist))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtist))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyGrouping))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTrackSubTitle))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyComposer))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyUserComment))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyUserGenre))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyReleaseDate))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTrackNumber))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDiscNumber))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVShow))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVEpisodeNumber))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVNetwork))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVEpisodeID))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVSeason))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySongDescription))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDescription))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyLongDescription))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySeriesDescription))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyStudio))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCast))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDirector))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCodirector))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyProducer))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyExecProducer))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyScreenwriters))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyLyrics))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCopyright))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyEncodedBy))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyKeywords))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCategory))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyPurchasedDate))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtDirector))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArranger))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAuthor))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAcknowledgement))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyConductor))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyRecordCompany))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyOriginalArtist))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySongProducer))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyPerformer))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyPublisher))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySoundEngineer))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySoloist))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCredits))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyThanks))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyWorkName))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementName))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementNumber))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementCount))
    }

}
