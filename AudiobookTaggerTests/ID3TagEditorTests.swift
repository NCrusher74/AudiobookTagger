//
//  AudiobookTaggerTests.swift
//  AudiobookTaggerTests
//
//  Created by Nolaine Crusher on 2/20/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import XCTest
import ID3TagEditor
@testable import AudiobookTagger

class ID3TagEditorTests: XCTestCase {
    
    func testID3() throws {
        let id3TagEditor = ID3TagEditor()
        if let id3Tag = try id3TagEditor.read(from: Bundle.testMp3FullMeta.path) {
            
        }
    }
      
    func testID3Writing() throws {
        let id3TagEditor = ID3TagEditor()
        let mp3Input = Bundle.testMp3NoMeta.path
        let mp3Output = "/Users/nolainecrusher/Downloads/audiobook_tools/sampleaax/test/id3TagEditor-test-output.mp3"

        let id3Tag = ID3Tag(
            version: .version4,
            frames: [
                .Composer : ID3FrameWithStringContent(content: "Composer"),
                .Album : ID3FrameWithStringContent(content: "Album"),
                .AlbumArtist : ID3FrameWithStringContent(content: "AlbumArtist"),
                .Artist : ID3FrameWithStringContent(content: "Artist"),
                .ITunesGrouping : ID3FrameWithStringContent(content: "Grouping"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "Part", content: "Part"),
                .ITunesMovementName : ID3FrameWithStringContent(content: "MovementName"),
                .ITunesMovementCount : ID3FrameWithIntegerContent(value: 8),
                .ITunesMovementIndex : ID3FrameWithIntegerContent(value: 7),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "Series Title", content: "SeriesTitle"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "Episode Number", content: "9"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "Episode Count", content: "10"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "Series Description", content: "SeriesDescription"),
                .Title : ID3FrameWithStringContent(content: "Title"),
                .Subtitle : ID3FrameWithStringContent(content: "Subtitle"),
                .PodcastDescription : ID3FrameWithStringContent(content: "PodcastDescription"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "Long Description", content: "LongDescription"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "Content Rating", content: "ContentRating"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "ContentAdvisory", content: "Content Advisory"),
                .PodcastCategory : ID3FrameWithStringContent(content: "PodcastCategory"),
                .PodcastKeywords : ID3FrameWithStringContent(content: "PodcastKeywords"),
                .Genre : ID3FrameGenre(genre: nil, description: "Genre"),
                .MediaType : ID3FrameWithStringContent(content: "Audiobook"),
                .TrackPosition : ID3FramePartOfTotal(part: 1, total: 2),
                .DiscPosition : ID3FramePartOfTotal(part: 3, total: 4),
                .Copyright : ID3FrameWithStringContent(content: "2020 Copyright"),
                .Publisher : ID3FrameWithStringContent(content: "Publisher"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "Acknowledgment", content: "Acknowledgment"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "Thanks", content: "Thanks"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "Liner Notes", content: "LinerNotes"),
                .Comment : ID3FrameCommentTypes(language: .und, description: "Credit", content: "Credits"),
                .UserDefinedTextInformation : ID3FrameUserDefinedText(description: "Series Sort", content: "SortSeries"),
                .Conductor : ID3FrameWithStringContent(content: "Conductor"),
                .Lyricist : ID3FrameWithStringContent(content: "Lyricist"),
                .UnsyncedLyrics : ID3FrameCommentTypes(language: .und, description: "Lyrics", content: "Lyrics"),
        ])

        try id3TagEditor.write(tag: id3Tag,
                               to: mp3Input,
                               andSaveTo: mp3Output)

        
    }
    
    
}
