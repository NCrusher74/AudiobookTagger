//
//  TagLibTests.swift
//  AudiobookTaggerTests
//
//  Created by Nolaine Crusher on 3/29/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import XCTest
import TagLibKit

class TagLibTests: XCTestCase {

    func testExample() throws {

        let tagLibRead = TaglibWrapper.getMetadata(Bundle.testMp3FullMeta.path)
        print(tagLibRead)
    }

    
    
    
}
