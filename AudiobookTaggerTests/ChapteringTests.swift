//
//  MP4ChapteringTests.swift
//  AudiobookTaggerTests
//
//  Created by Nolaine Crusher on 3/4/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import XCTest
import MP42Foundation
import OutcastID3
@testable import AudiobookTagger

class MP4ChapteringTests: XCTestCase {
    
    func testMP4Chapters() throws {
        let mp4File = try MP42File(url: Bundle.testM4bChapteredBlank)
        let chapterTrack = mp4File.chapters
        let chapterCountAsInt = chapterTrack?.chapterCount() ?? 0
        let chapterIndex = 0..<chapterCountAsInt
        for i in chapterIndex {
            print(i)
            print(mp4File.chapters?.chapter(at: UInt(i)).title ?? "")
            print((mp4File.chapters?.chapter(at: UInt(i)).timestamp) ?? 0)
        }
        let chapterZed = mp4File.chapters?.chapter(at: 0)
        mp4File.chapters?.setTitle("BobsUrUncle", forChapter: chapterZed!)
        let outputUrl = URL(fileURLWithPath: (NSHomeDirectory() + "/MP42Foundation-testchapters.m4b"))
        XCTAssertNoThrow(try mp4File.write(to: outputUrl, options: nil))
        



        //        chapterTrack?.removeChapters(at: [0,1,2,3])
        //        chapterTrack?.addChapter("ch95", duration: 0)
        //        chapterTrack?.addChapter("ch96", duration: 7)
        //        chapterTrack?.addChapter("ch97", duration: 14)
        //        chapterTrack?.addChapter("ch98", duration: 21)
        //        chapterTrack?.addChapter("ch99", duration: 28)
        //


    }
}

