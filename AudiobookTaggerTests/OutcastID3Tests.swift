//
//  OutcastID3Tests.swift
//  AudiobookTaggerTests
//
//  Created by Nolaine Crusher on 3/4/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import XCTest
import OutcastID3
@testable import AudiobookTagger

class OutcastID3Tests: XCTestCase {
    
    func testChapters() throws {
        let url = Bundle.testMp3ChapteredBlank
        
        let outcastFile = try OutcastID3.MP3File(localUrl: url)
        let outcastTag = try outcastFile.readID3Tag()
        
        for frame in outcastTag.tag.frames {
            switch frame {
            case let s as OutcastID3.Frame.StringFrame:
                print("\(s.type.description): \(s.str)")
            case let u as OutcastID3.Frame.UrlFrame:
                print("\(u.type.description): \(u.urlString)")
            case let comment as OutcastID3.Frame.CommentFrame:
                print("COMMENT: \(comment)")
            case let transcription as OutcastID3.Frame.TranscriptionFrame:
                print("TRANSCRIPTION: \(transcription)")
            case let picture as OutcastID3.Frame.PictureFrame:
                print("PICTURE: \(picture)")
                
            case let f as OutcastID3.Frame.ChapterFrame:
                print("CHAPTER: \(f)")
            case let toc as OutcastID3.Frame.TableOfContentsFrame:
                print("TOC: \(toc)")
            
            case let rawFrame as OutcastID3.Frame.RawFrame:
                print("Unrecognised frame: \(String(describing: rawFrame.frameIdentifier))")
            default:
                break
            }
        }
    }
    
    
    func testChapterWriting() throws {
//        let url = Bundle.testMp3ChapteredBlank
//        let outcastFile = try OutcastID3.MP3File(localUrl: url)
//        
//        let frames: [OutcastID3TagFrame] = [
//            OutcastID3.Frame.ChapterFrame(elementId: "ch95", startTime: 0.0, endTime: 5.0, startByteOffset: 0, endByteOffset: 0, subFrames: [OutcastID3.Frame.StringFrame(type: .title, encoding: .utf8, str: "test95")]),
//            OutcastID3.Frame.ChapterFrame(elementId: "ch96", startTime: 5.0, endTime: 10.0, startByteOffset: 0, endByteOffset: 0, subFrames: [OutcastID3.Frame.StringFrame(type: .title, encoding: .utf8, str: "test96")]),
//            OutcastID3.Frame.ChapterFrame(elementId: "ch97", startTime: 10.0, endTime: 15.0, startByteOffset: 0, endByteOffset: 0, subFrames: [OutcastID3.Frame.StringFrame(type: .title, encoding: .utf8, str: "test97")]),
//            OutcastID3.Frame.ChapterFrame(elementId: "ch98", startTime: 15.0, endTime: 20.0, startByteOffset: 0, endByteOffset: 0, subFrames: [OutcastID3.Frame.StringFrame(type: .title, encoding: .utf8, str: "test98")]),
//            OutcastID3.Frame.ChapterFrame(elementId: "ch99", startTime: 25.0, endTime: 30.0, startByteOffset: 0, endByteOffset: 0, subFrames: [OutcastID3.Frame.StringFrame(type: .title, encoding: .utf8, str: "test99")]),
//            OutcastID3.Frame.TableOfContentsFrame(elementId: "TOC", isTopLevel: true, isOrdered: true, childElementIds: ["ch95","ch96","ch97","ch98","ch99"], subFrames: [])
//        ]
//        
//        let testTag = OutcastID3.ID3Tag(
//            version: .v2_4,
//            frames: frames
//        )
//        
//        let outputUrl = URL(fileURLWithPath: NSHomeDirectory() + "/OutcastID3-testfile.mp3")
//        try outcastFile.writeID3Tag(tag: testTag, outputUrl: outputUrl)
//    }
    

}
