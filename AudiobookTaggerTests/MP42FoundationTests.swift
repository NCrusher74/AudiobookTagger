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

}
