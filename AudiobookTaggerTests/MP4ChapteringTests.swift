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
        let chapterTrack = mp4File.track(at: 1)
        print(chapterTrack)
        mp4File.removeTracks([chapterTrack])

        let replacementChapters: MP42ChapterTrack = mp4File.chapters ?? nil
        let chapter1 = replacementChapters.chapter(at: UInt(0))
        replacementChapters.setTitle("ch95", forChapter: chapter1)
        let timestamp = TimeFromString("8", 1000)
        replacementChapters.setTimestamp(timestamp, forChapter: chapter1)

        let chapter2 = replacementChapters.chapter(at: UInt(1))
        replacementChapters.setTitle("ch96", forChapter: chapter2)
        replacementChapters.setTimestamp(timestamp, forChapter: chapter2)

        let chapter3 = replacementChapters.chapter(at: UInt(2))
        replacementChapters.setTitle("ch97", forChapter: chapter3)
        replacementChapters.setTimestamp(timestamp, forChapter: chapter3)

        let chapter4 = replacementChapters.chapter(at: UInt(3))
        replacementChapters.setTitle("ch98", forChapter: chapter4)
        replacementChapters.setTimestamp(timestamp, forChapter: chapter4)

        let chapter5 = replacementChapters.chapter(at: UInt(4))
        replacementChapters.setTitle("ch99", forChapter: chapter5)
        replacementChapters.setTimestamp(timestamp, forChapter: chapter5)
        replacementChapters.addChapter(chapter1)
        replacementChapters.addChapter(chapter2)
        replacementChapters.addChapter(chapter3)
        replacementChapters.addChapter(chapter4)
        replacementChapters.addChapter(chapter5)

        mp4File.addTrack(replacementChapters)
        let outputUrl = URL(fileURLWithPath: (NSHomeDirectory() + "/MP42Foundation-testchapters.m4b"))
         XCTAssertNoThrow(try mp4File.write(to: outputUrl, options: nil))
    }
}
