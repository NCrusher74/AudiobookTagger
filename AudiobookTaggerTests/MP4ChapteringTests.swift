//
//  MP4ChapteringTests.swift
//  AudiobookTaggerTests
//
//  Created by Nolaine Crusher on 3/4/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import XCTest
import MP42Foundation
@testable import AudiobookTagger

class MP4ChapteringTests: XCTestCase {

    func testMP4Chapters() throws {
        let mp4File = try MP42File(url: Bundle.testM4bChapteredBlank)
        let chapterTrack = mp4File.chapters

        //print(chapterTrack?.chapterCount())
        chapterTrack?.removeChapters(at: [0,1,2,3])
        chapterTrack?.addChapter("ch95", duration: 0)
        chapterTrack?.addChapter("ch96", duration: 7)
        chapterTrack?.addChapter("ch97", duration: 14)
        chapterTrack?.addChapter("ch98", duration: 21)
        chapterTrack?.addChapter("ch99", duration: 28)
        
        let outputUrl = URL(fileURLWithPath: (NSHomeDirectory() + "/MP42Foundation-testchapters.m4b"))
         XCTAssertNoThrow(try mp4File.write(to: outputUrl, options: nil))
    }
}
