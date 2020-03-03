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

class MP42FoundationTests: XCTestCase {
    
    func testMetadataValues() throws {
        print(MP42MetadataKeyName)
        // Note to self: refer to this post for suggestions on how to dissect a complicated fatal error.
        // https://github.com/NCrusher74/AudiobookTagger/pull/1#discussion_r384889197
    }
    
    func testMP4TagPresence() throws {
        let mp4File = try MP42File(url: URL(fileURLWithPath: Bundle.testM4bFullMeta.path))
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
        let mp4File = try MP42File(url: URL(fileURLWithPath: Bundle.testM4bFullMeta.path))
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyName).first?.stringValue, "Title")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAlbum).first?.stringValue, "Album")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAlbumArtist).first?.stringValue, "AlbumArtist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtist).first?.stringValue, "Artist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyGrouping).first?.stringValue, "Grouping")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTrackSubTitle).first?.stringValue, "Subtitle")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyComposer).first?.stringValue, "Composer")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyUserComment).first?.stringValue, "Comment")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyUserGenre).first?.stringValue, "Genre")

        let formatter = DateFormatter()
        formatter.dateStyle = .short
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
        byIdentifier: MP42MetadataKeyReleaseDate).first?.dateValue, formatter.date(from: "01/01/2020"))
        
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTrackNumber).first?.arrayValue as! [Int], [7,8])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDiscNumber).first?.arrayValue as! [Int], [1,2])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVShow).first?.stringValue, "TVShow")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVEpisodeNumber).first?.numberValue, 3)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVNetwork).first?.stringValue, "TVNetwork")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVEpisodeID).first?.stringValue, "TVEpisodeName")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyTVSeason).first?.numberValue, 4)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySongDescription).first?.stringValue, "SongDescription")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDescription).first?.stringValue, "Description")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyLongDescription).first?.stringValue, "LongDescription")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySeriesDescription).first?.stringValue, "SeriesDescription")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyLyrics).first?.stringValue, "Lyrics")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyStudio).first?.stringValue, "Studio")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCast).first?.arrayValue as! [String], ["Cast", "More Cast"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyDirector).first?.arrayValue as! [String], ["Director"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCodirector).first?.arrayValue as! [String], ["Codirector"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyProducer).first?.arrayValue as! [String], ["Producers"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyExecProducer).first?.stringValue, "ExecutiveProducer")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyScreenwriters).first?.arrayValue as! [String], ["Screenwriters"])
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCopyright).first?.stringValue, "Copyright")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyEncodedBy).first?.stringValue, "EncodedBy")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyKeywords).first?.stringValue, "Keywords")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCategory).first?.stringValue, "Category")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArtDirector).first?.stringValue, "ArtDirector")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyArranger).first?.stringValue, "Arranger")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAuthor).first?.stringValue, "Lyricist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyAcknowledgement).first?.stringValue, "Acknowledgment")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyConductor).first?.stringValue, "Conductor")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyRecordCompany).first?.stringValue, "RecordCompany")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyOriginalArtist).first?.stringValue, "OriginalArtist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySongProducer).first?.stringValue, "SongProducer")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyPerformer).first?.stringValue, "Performer")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyPublisher).first?.stringValue, "Publisher")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySoundEngineer).first?.stringValue, "SoundEngineer")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeySoloist).first?.stringValue, "Soloist")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyCredits).first?.stringValue, "Credits")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyThanks).first?.stringValue, "Thanks")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyWorkName).first?.stringValue, "WorkName")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementName).first?.stringValue, "MovementName")
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementNumber).first?.numberValue, 5)
        XCTAssertEqual(mp4File.metadata.metadataItemsFiltered(
            byIdentifier: MP42MetadataKeyMovementCount).first?.numberValue, 6)
    }
    
    
    
    // Test Write Code
    func testMP4Writing() {
        do {
            let mp42File = try MP42File(url: Bundle.testM4bNoMeta)
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyWorkName,
                value: "WorkName" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyMovementName,
                value: "MovementName" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyMovementNumber,
                value: 5 as NSNumber,
                dataType: MP42MetadataItemDataType.integer,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyMovementCount,
                value: 6 as NSNumber,
                dataType: MP42MetadataItemDataType.integer,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyName,
                value: "Title" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyArtist,
                value: "Artist" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyAlbum,
                value: "Album" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyAlbumArtist,
                value: "AlbumArtist" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyGrouping,
                value: "Grouping" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyComposer,
                value: "Composer" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyCopyright,
                value: "Copyright" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))

            let formatter = DateFormatter()
            formatter.dateStyle = .short
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyReleaseDate,
                value: formatter.date(from: "01/01/2020")! as NSDate,
                dataType: MP42MetadataItemDataType.date,
                extendedLanguageTag: nil))

            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyUserComment,
                value: "Comment" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeySongDescription,
                value: "SongDescription" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyDescription,
                value: "Description" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeySeriesDescription,
                value: "SeriesDescription" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyLongDescription,
                value: "LongDescription" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyLyrics,
                value: "Lyrics" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyUserGenre,
                value: "Genre" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyTrackSubTitle,
                value: "Subtitle" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyTrackNumber,
                value: ([7,8] as [NSNumber]) as NSArray,
                dataType: MP42MetadataItemDataType.integerArray,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyDiscNumber,
                value: ([1,2] as [NSNumber]) as NSArray,
                dataType: MP42MetadataItemDataType.integerArray,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyTVShow,
                value: "TVShow" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyTVEpisodeNumber,
                value: 3 as NSNumber,
                dataType: MP42MetadataItemDataType.integer,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyTVNetwork,
                value: "TVNetwork" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyTVEpisodeID,
                value: "TVEpisodeName" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyTVSeason,
                value: 4 as NSNumber,
                dataType: MP42MetadataItemDataType.integer,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyStudio,
                value: "Studio" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyCast,
                value: (["Cast", "More Cast"] as [NSString]) as NSArray,
                dataType: MP42MetadataItemDataType.stringArray,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyDirector,
                value: (["Director"] as [NSString]) as NSArray,
                dataType: MP42MetadataItemDataType.stringArray,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyCodirector,
                value: (["Codirector"] as [NSString]) as NSArray,
                dataType: MP42MetadataItemDataType.stringArray,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyProducer,
                value: (["Producers"] as [NSString]) as NSArray,
                dataType: MP42MetadataItemDataType.stringArray,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyExecProducer,
                value: "ExecutiveProducer" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyScreenwriters,
                value: (["Screenwriters"] as [NSString]) as NSArray,
                dataType: MP42MetadataItemDataType.stringArray,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyEncodedBy,
                value: "EncodedBy" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyKeywords,
                value: "Keywords" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyCategory,
                value: "Category" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyArtDirector,
                value: "ArtDirector" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyArranger,
                value: "Arranger" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyAuthor,
                value: "Lyricist" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyAcknowledgement,
                value: "Acknowledgment" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyConductor,
                value: "Conductor" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyRecordCompany,
                value: "RecordCompany" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyOriginalArtist,
                value: "OriginalArtist" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeySongProducer,
                value: "SongProducer" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyPerformer,
                value: "Performer" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyPublisher,
                value: "Publisher" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeySoundEngineer,
                value: "SoundEngineer" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeySoloist,
                value: "Soloist" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyCredits,
                value: "Credits" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            mp42File.metadata.addItem(MP42MetadataItem(
                identifier: MP42MetadataKeyThanks,
                value: "Thanks" as NSString,
                dataType: MP42MetadataItemDataType.string,
                extendedLanguageTag: nil))
            
            let outputUrl = URL(fileURLWithPath: "/Users/nolainecrusher/Downloads/audiobook_tools/sampleaax/test/_testfile.m4b")
            XCTAssertNoThrow(try mp42File.write(to: outputUrl, options: nil))
        } catch {print("oops")}
        
    }
}
