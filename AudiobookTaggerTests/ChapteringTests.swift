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
    }
}
        
        

        

        
//        chapterTrack?.removeChapters(at: [0,1,2,3])
//        chapterTrack?.addChapter("ch95", duration: 0)
//        chapterTrack?.addChapter("ch96", duration: 7)
//        chapterTrack?.addChapter("ch97", duration: 14)
//        chapterTrack?.addChapter("ch98", duration: 21)
//        chapterTrack?.addChapter("ch99", duration: 28)
//



class OutcastID3Tests: XCTestCase {
    
    func testID3ChaptersListing() throws {
        var chapterElementsDictionary: [String:Any] = [:]
        let outcastFile = try OutcastID3.MP3File(
            localUrl: Bundle.testMp3ChapteredBlank)
        let outcastFrames = try outcastFile.readID3Tag().tag.frames
        var index = 0
        for frame in outcastFrames {
            if let chapterFrame = frame as? OutcastID3.Frame.ChapterFrame {
                let chapterIndex = index
                chapterElementsDictionary["chapterIndex (for frame at \(index))"] = chapterIndex
                chapterElementsDictionary["elementID (for frame at \(index))"] = chapterFrame.elementId
                chapterElementsDictionary["chapterStartTime (for frame at \(index))"] = chapterFrame.startTime
                chapterElementsDictionary["chapterEndTime for frame at \(index)"] = chapterFrame.endTime
                chapterElementsDictionary["chapterStartByteOffset for frame at \(index)"] = chapterFrame.startByteOffset
                chapterElementsDictionary["chapterEndByteOffset for frame at \(index)"] = chapterFrame.endByteOffset
                let subFrames = chapterFrame.subFrames
                for frame in subFrames {
                    if let chapterTitle = frame as? OutcastID3.Frame.StringFrame {
                        chapterElementsDictionary["chapterTitle"] = chapterTitle.str
                    }
                }
                index += 1
            }; print(chapterElementsDictionary)
        }

        
    }
    
    func testGetFrameIndex() throws {
        let url = Bundle.testMp3ChapteredBlank
        let outcastFile = try OutcastID3.MP3File(localUrl: url)
        var outcastTag = try outcastFile.readID3Tag()
        var outcastFrames = outcastTag.tag.frames
        var index = 0
        for frame in outcastFrames {
            index += 1
            if let chapterFrame = frame as? OutcastID3.Frame.ChapterFrame {
                print("Chapter \(index) Index = \(index)")
            }
        }
    }
    
    
    
    
    
    
    
    
    
}
