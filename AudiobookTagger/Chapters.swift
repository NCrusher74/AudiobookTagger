//
//  AudiobookChaptering.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/5/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import OutcastID3

struct Chapters {
    
    var audiobookFile: AudiobookFile
    
    init(for audiobookFile: AudiobookFile) {
        self.audiobookFile = audiobookFile
    }
    
    /// accesses the ID3 `TableOfContents` frame
    var id3TocFrame: OutcastID3.Frame.TableOfContentsFrame? {
        do {
            let outcastFile = try OutcastID3.MP3File(localUrl: audiobookFile.audiobookUrl)
            let outcastTag = try outcastFile.readID3Tag()
            for frame in outcastTag.tag.frames {
                if let toc = frame as? OutcastID3.Frame.TableOfContentsFrame {
                    return toc
                }
            }
        } catch { print("unable to read table of contents frame", error, error.localizedDescription)}
        ; return nil
    }

    /// accesses the ID3 `ChapterFrame`
    var id3ChapterFrame: OutcastID3.Frame.ChapterFrame? {
        do {
            let outcastFile = try OutcastID3.MP3File(localUrl: audiobookFile.audiobookUrl)
            let outcastTag = try outcastFile.readID3Tag()
            for frame in outcastTag.tag.frames {
                if let chapter = frame as? OutcastID3.Frame.ChapterFrame {
                    return chapter
                }
            }
        } catch { print("unable to read chapter frame", error, error.localizedDescription)}
        ; return nil
    }
    
    func chapterData() throws -> [String: Any] {
        switch audiobookFile.format {
            /// returns date for mp3 chapters:
            /// `chapterIndex`,
            /// `chapterTitle`,
            /// `elementID`,
            /// `chapterStartTime`,
            /// `chapterEndTime`,
            /// `chapterStartByteOffset`
            /// `chapterEndByteOffset`
            case .mp3 :
                var chapterElementsDictionary: [String:Any] = [:]
                let outcastFile = try OutcastID3.MP3File(
                    localUrl: audiobookFile.audiobookUrl)
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
                    }
                }
            /// returns index, title, and timestamp for MP4 frame
            case .mp4 :
                var chapterElementsDictionary: [String: Any] = [:]
                let mp4File = try MP42File(url: audiobookFile.audiobookUrl)
                let chapterTrack = mp4File.chapters
                let chapterCountAsInt = chapterTrack?.chapterCount() ?? 0
                let chapterIndex = 0..<chapterCountAsInt
                for i in chapterIndex {
                    chapterElementsDictionary["chapterIndex"] = i
                    chapterElementsDictionary["chapterTitle"] = mp4File.chapters?.chapter(
                        at: UInt(i)).title ?? ""
                    chapterElementsDictionary["chapterStartInMilliseconds"] =
                        (mp4File.chapters?.chapter(at: UInt(i)).timestamp) ?? 0
                    return chapterElementsDictionary
                }
            
            case .invalid :
                throw AudiobookFile.Error.unknownFileFormat
        }; return [:]
    }
    
//    func renameChapter() {
//        switch audiobookFile.format {
//            case .mp3
//            
//            case .mp4
//            
//            case .invalid
//        }
//    }
    
}
