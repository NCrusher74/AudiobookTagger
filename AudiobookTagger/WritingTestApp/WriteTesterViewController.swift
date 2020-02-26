//
//  WriteTesterViewController.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/25/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Cocoa
import ID3TagEditor
import MP42Foundation

class WriteTesterViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func excuteTestCode(_ sender: Any) {
        let inputPath = "/Users/nolainecrusher/Downloads/audiobook_tools/sampleaax/test/testfile-nometa.m4b"
        let outputPath = "/Users/nolainecrusher/Downloads/audiobook_tools/sampleaax/test/testfile-mp42-fullmeta.m4b"
        //testID3TagEditorWriting(.version3, inputPath: inputPath, outputPath: outputPath)
        
        let inputUrl = URL(fileURLWithPath: inputPath)
        let outputUrl = URL(fileURLWithPath: outputPath)
        do {
            try testMP42FoundationWriting(inputUrl: inputUrl, outputUrl: outputUrl)
        } catch { print("ruhroh shaggy!") }
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
                    .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords TKWD"),
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
    func testMP42FoundationWriting(inputUrl: URL, outputUrl: URL) throws {
        let mp42File = try MP42File(url: inputUrl)
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Work Name", value: "Work Name ©wrk" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Movement Name", value: "Movement Name ©mvn" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Movement Index", value: "5" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Movement Count", value: "6" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Name", value: "Title ©nam" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Artist", value: "Artist ©art" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Album", value: "Album ©alb" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Album Artist", value: "AlbumArtist aART" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Grouping", value: "Grouping ©grp" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Composer", value: "Composer ©wrt" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Copyright", value: "Copyright ©cpy" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Release Date", value: "Year ©day" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Comments", value: "This is a comment it can be up to 255 bytes long ©cmt" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Song Description", value: "This is a description it can also be up to 255 bytes long desc" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Description", value: "This is a description it can also be up to 255 bytes long desc" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Series Description", value: "This is a description it can also be up to 255 bytes long ©des" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Long Description", value: "This is a description it can be as long as you like ldes" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Lyrics", value: "This is a lyric field it can be as long as you like ©des" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Purchase Date", value: "PurchaseDate purd" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Genre", value: "Genre ©gen" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Track Sub-Title", value: "Subtitle ???" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        // mp42File.metadata.addItem(MP42MetadataItem(identifier: "Release Date", value: "Year rldt" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Track #", value: [7,8], dataType: MP42MetadataItemDataType.integerArray, extendedLanguageTag: nil))
        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Disk #", value: [1,2], dataType: MP42MetadataItemDataType.integerArray, extendedLanguageTag: nil))
        
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "TV Show", value: "TV Show tvsh" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "TV Episode #", value: "3" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "TV Network", value: "TV Network tvnn" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "TV Episode ID", value: "TV Episode Name tves" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "TV Season", value: "4" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Studio", value: "Studio" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Cast", value: "Cast" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Director", value: "Director ©dir" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Codirector", value: "Co-director" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Producers", value: "Producers ©prd" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Executive Producer", value: "Executive Producer" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Screenwriters", value: "Screenwriters" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Encoded By", value: "Encoded By" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Keywords", value: "Keywords" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Category", value: "Category" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Art Director", value: "Art Director" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Arranger", value: "Arranger ©arg" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Lyricist", value: "Lyricist" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Acknowledgement", value: "Acknowledgment ©thx" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Conductor", value: "Conductor" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Record Company", value: "Record Company" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Original Artist", value: "Original Artist" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Song Producer", value: "Song Producer" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Performer", value: "Performer ©prf" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Publisher", value: "Publisher ©pub" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Sound Engineer", value: "Sound Engineer" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Soloist", value: "Soloist" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Credits", value: "Credits ©src" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Thanks", value: "Thanks ©thx" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        mp42File.metadata.addItem(MP42MetadataItem(identifier: "Work Name", value: "Work Name " as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//        // mp42File.metadata.addItem(MP42MetadataItem(identifier: "Author", value: "Author ©aut" as NSString, dataType: MP42MetadataItemDataType.string, extendedLanguageTag: nil))
//
        try mp42File.write(to: outputUrl, options: nil)
        
    }
    
}
