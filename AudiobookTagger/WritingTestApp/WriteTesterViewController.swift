//
//  WriteTesterViewController.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/25/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Cocoa
import ID3TagEditor

class WriteTesterViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func excuteTestCode(_ sender: Any) {
        let inputPath = "/Users/nolainecrusher/Downloads/audiobook_tools/sampleaax/test/testfile-nometa.mp3"
        let outputPath = "/Users/nolainecrusher/Downloads/audiobook_tools/sampleaax/test/testfile-id3TE-fullmetaV3.mp3"
        testID3TagEditorWriting(.version3, inputPath: inputPath, outputPath: outputPath)
    }
    
    func testID3TagEditorWriting(_ version: ID3Version, inputPath: String, outputPath: String) {
        let id3TagEditor = ID3TagEditor()
        let input = inputPath
        let output = outputPath
        do {
            let id3Tag = ID3Tag(
                version: version,
                frames: [
                    .Artist : ID3FrameWithStringContent(content: "Artist TPE1"),
                    .AlbumArtist : ID3FrameWithStringContent(content: "Album Artist TPE2"),
                    .Album : ID3FrameWithStringContent(content: "Album TALB"),
                    .Title : ID3FrameWithStringContent(content: "Title TIT2"),
                    .Comment : ID3FrameWithStringContent(content: "This is a short comment. It can be 255 characters and is saved using the frame COMM"),
                    .Composer : ID3FrameWithStringContent(content: "Composer TCOM"),
                    .Conductor : ID3FrameWithStringContent(content: "Conductor TPE3"),
                    .ContentGrouping : ID3FrameWithStringContent(content: "ContentGrouping TIT1"),
                    .Copyright : ID3FrameWithStringContent(content: "Copyright TCOP"),
                    .DiscPosition : ID3FrameDiscPosition(position: 1, totalDiscs: 2),
                    .EncodedBy : ID3FrameWithStringContent(content: "EncodedBy TENC"),
                    .EncoderSettings : ID3FrameWithStringContent(content: "EncoderSettings TSSE"),
                    .FileOwner : ID3FrameWithStringContent(content: "FileOwner TOWN"),
                    .FileType : ID3FrameWithStringContent(content: "FileType TFLT"),
                    .Genre : ID3FrameGenre(genre: nil, description: "Genre TCON"),
                    .Grouping : ID3FrameWithStringContent(content: "Grouping GRP1"),
                    .Language : ID3FrameWithStringContent(content: "Language TLAN"),
                    .Lyricist : ID3FrameWithStringContent(content: "Lyricist TEXT"),
                    .MediaType : ID3FrameWithStringContent(content: "MediaType TMED"),
                    .MixArtist : ID3FrameWithStringContent(content: "MixArtist TPE4"),
                    .MovementIndex : ID3FrameMovementIndex(index: 3, totalMovements: 4),
                    .MovementName : ID3FrameWithStringContent(content: "MovementName MVNM"),
                    .PodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory TCAT"),
                    .PodcastDescription : ID3FrameWithStringContent(content: "This is a description saved under TDES, and I think it can be up to 255 characters."),
                    .PodcastID : ID3FrameWithStringContent(content: "PodcastID TGID"),
                    .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords PKWD"),
                    // NOTE: Podcast keyword should be TKWD but I typoed when running the test
                    .Publisher : ID3FrameWithStringContent(content: "Publisher TPUB"),
                    .RecordingDayMonth : ID3FrameRecordingDayMonth(day: 01, month: 01),
                    .RecordingYear : ID3FrameRecordingYear(year: 2020),
                    .SeriesIndex : ID3FrameSeriesIndex(index: 5, totalBooks: 6),
                    .Subtitle : ID3FrameWithStringContent(content: "Subtitle TIT3"),
                    .TrackPosition : ID3FrameTrackPosition(position: 7, totalTracks: 8),
                    .UnsyncedLyrics : ID3FrameWithStringContent(content: "This is a long comment saved under the lyrics tag and it can be longer than 255 characters. I hope. USLT")
                ]
            )
            
            try id3TagEditor.write(tag: id3Tag,
                                   to: input,
                                   andSaveTo: output)
        } catch {
            print(error)
        }
    }
    
}
