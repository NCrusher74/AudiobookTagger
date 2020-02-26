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
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Artist"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Album"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Album Artist"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Artist"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Grouping"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Name"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Track Subtitle"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Composer"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Comments"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Genre"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Release Date"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Track #"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Disk #"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Artist"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "TV Show"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "TV Episode E"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "TV Network"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "TV Episode ID"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "TV Season"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Sond Description"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Description"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Long Description"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Series Description"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Studio"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Cast"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Director"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Codirector"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Producers"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Executive Producer"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Screenwriters"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Lyrics"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Copyright"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Encoded By"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Keywords"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Category"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Purchase Date"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Art Director"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Arranger"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Lyricist"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Acknowledgement"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Conductor"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Record Company"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Original Artist"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Song Producer"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Performer"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Publisher"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Sound Engineer"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Soloist"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Credits"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Thanks"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Work Name"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Movement Name"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Movement Number"))
        XCTAssertNotNil(mp4File.metadata.metadataItemsFiltered(byIdentifier: "Movement Count"))
    }

}
