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

    func testMetadataValues() throws {
        let mp4File = try MP42File(url: URL(fileURLWithPath: Bundle.testM4bFullMeta))
        print(mp4File.metadata) // <MP42Metadata: 0x60000026a860>
        print(MP42MetadataKeyArtist) // Artist (should be "Artist ©art"

        print(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtist)) // [<MP42MetadataItem: Artist ©art>] getting closer

        print (mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtist).first!) // <MP42MetadataItem: Artist ©art>
        
        let artist = mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtist).first?.stringValue ?? ""
        print(artist)
        XCTAssert(1 == 1)
    }
    
    func testMP4TagPresence() throws {
        let mp4File = try MP42File(url: URL(fileURLWithPath: Bundle.testM4bFullMeta))
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
        byIdentifier: MP42MetadataKeyName).count > 0),
                  "The Name array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAlbum).count > 0),
                  "The Album array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAlbumArtist).count > 0),
                  "The Album Artist array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtist).count > 0),
                  "The Artist array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyGrouping).count > 0),
                  "The Grouping array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTrackSubTitle).count > 0),
                  "The Track Subtitle array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyComposer).count > 0),
                  "The Composer array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyUserComment).count > 0),
                  "The User Comment array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyUserGenre).count > 0),
                  "The User Genre array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyReleaseDate).count > 0),
                  "The Release Date array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTrackNumber).count > 0),
                  "The Track Number array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDiscNumber).count > 0),
                  "The Disc Number array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVShow).count > 0),
                  "The TVShow array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVEpisodeNumber).count > 0),
                  "The TVEpisode Number array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVNetwork).count > 0),
                  "The TV Network array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVEpisodeID).count > 0),
                  "The TVEpisode ID array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVSeason).count > 0),
                  "The TV Season array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySongDescription).count > 0),
                  "The Song Description array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDescription).count > 0),
                  "The Description array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyLongDescription).count > 0),
                  "The Long Description array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySeriesDescription).count > 0),
                  "The Series Description array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyStudio).count > 0),
                  "The Studio array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCast).count > 0),
                  "The Cast array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDirector).count > 0),
                  "The Director array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCodirector).count > 0),
                  "The Codirector array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyProducer).count > 0),
                  "The Producer array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyExecProducer).count > 0),
                  "The Executive Producer array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyScreenwriters).count > 0),
                  "The Screenwriters array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyLyrics).count > 0),
                  "The Lyrics array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCopyright).count > 0),
                  "The Copyright array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyEncodedBy).count > 0),
                  "The EncodedBy array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyKeywords).count > 0),
                  "The Keywords array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCategory).count > 0),
                  "The Category array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtDirector).count > 0),
                  "The Art Director array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArranger).count > 0),
                  "The Arranger array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAuthor).count > 0),
                  "The Lyricist/Author array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAcknowledgement).count > 0),
                  "The Acknowledgment array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyConductor).count > 0),
                  "The Conductor array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyRecordCompany).count > 0),
                  "The Record Company array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyOriginalArtist).count > 0),
                  "The Original Artist array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySongProducer).count > 0),
                  "The Song Producer array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyPerformer).count > 0),
                  "The Performer array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyPublisher).count > 0),
                  "The Publisher array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySoundEngineer).count > 0),
                  "The Sound Engineer array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySoloist).count > 0),
                  "The Soloist array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCredits).count > 0),
                  "The Credits array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyThanks).count > 0),
                  "The Thanks array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyWorkName).count > 0),
                  "The Work Name array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementName).count > 0),
                  "The Movement Name array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementNumber).count > 0),
                  "The Movement Number array is empty")
        XCTAssert((mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementCount).count > 0),
                  "The Movement Count array is empty")
    }
    
    

}
