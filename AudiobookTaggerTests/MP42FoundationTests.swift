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
        
        let epArray = mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyExecProducer).first?.arrayValue
        print(epArray!)
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
    
    func testMP4TagAccuracy() throws {
        let mp4File = try MP42File(url: URL(fileURLWithPath: Bundle.testM4bFullMeta))
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyName).first?.stringValue, "Title ©nam")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAlbum).first?.stringValue, "Album ©alb")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAlbumArtist).first?.stringValue, "AlbumArtist aART")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtist).first?.stringValue, "Artist ©art")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyGrouping).first?.stringValue, "Grouping ©grp")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTrackSubTitle).first?.stringValue, "Subtitle ???")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyComposer).first?.stringValue, "Composer ©wrt")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyUserComment).first?.stringValue, "This is a comment it can be up to 255 bytes long ©cmt")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyUserGenre).first?.stringValue, "Genre ©gen")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyReleaseDate).first?.stringValue, "01/01/2020")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTrackNumber).first?.arrayValue as! [Int], [7,8])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDiscNumber).first?.arrayValue as! [Int], [1,2])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVShow).first?.stringValue, "TV Show tvsh")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVEpisodeNumber).first?.numberValue, 3)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVNetwork).first?.stringValue, "TV Network tvnn")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVEpisodeID).first?.stringValue, "TV Episode Name tves")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVSeason).first?.numberValue, 4)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySongDescription).first?.stringValue, "This is a description it can also be up to 255 bytes long desc")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDescription).first?.stringValue, "This is a description it can also be up to 255 bytes long desc")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyLongDescription).first?.stringValue, "This is a description it can be as long as you like ldes")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySeriesDescription).first?.stringValue, "This is a description it can also be up to 255 bytes long ©des")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyLyrics).first?.stringValue, "This is a lyric field it can be as long as you like ©des")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyStudio).first?.stringValue, "Studio")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCast).first?.arrayValue as! [String], ["Cast", "More Cast"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDirector).first?.arrayValue as! [String], ["Director ©dir"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCodirector).first?.arrayValue as! [String], ["Co-director"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyProducer).first?.arrayValue as! [String], ["Producers ©prd"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyExecProducer).first?.arrayValue as! [String], ["Executive Producer"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyScreenwriters).first?.arrayValue as! [String], ["Screenwriters"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCopyright).first?.stringValue, "Copyright ©cpy")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyEncodedBy).first?.stringValue, "Encoded By")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyKeywords).first?.stringValue, "Keywords")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCategory).first?.stringValue, "Category")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtDirector).first?.stringValue, "Art Director")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArranger).first?.stringValue, "Arranger ©arg")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAuthor).first?.stringValue, "Lyricist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAcknowledgement).first?.stringValue, "Acknowledgment ©thx")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyConductor).first?.stringValue, "Conductor")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyRecordCompany).first?.stringValue, "Record Company")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyOriginalArtist).first?.stringValue, "Original Artist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySongProducer).first?.stringValue, "Song Producer")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyPerformer).first?.stringValue, "Performer ©prf")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyPublisher).first?.stringValue, "Publisher ©pub")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySoundEngineer).first?.stringValue, "Sound Engineer")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySoloist).first?.stringValue, "Soloist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCredits).first?.stringValue, "Credits ©src")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyThanks).first?.stringValue, "Thanks ©thx")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyWorkName).first?.stringValue, "Work Name ©wrk")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementName).first?.stringValue, "Movement Name ©mvn")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementNumber).first?.numberValue, 5)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementCount).first?.numberValue, 6)
    }
}
