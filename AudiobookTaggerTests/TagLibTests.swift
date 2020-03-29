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

    func testWriting() throws {
        var dict = [String: String]()
        dict["COMMENT"] = "Comments"
        dict["TITLE"] = "Title"
        dict["ARTIST"] = "Artist"
        dict["COMPOSER"] = "Composer"
        dict["ALBUM"] = "Album"
        dict["GENRE"] = "Genre"
        dict["PUBLISHER"] = "Publisher"
        dict["GROUPING"] = "Grouping" //Universe Title
        dict["PART"] = "Part" //Universe Index/Count
        dict["MOVEMENTNAME"] = "MovementName" //Series Title
        dict["MOVEMENTNUMBER"] = "7" //Series Season Number
        dict["MOVEMENTCOUNT"] = "8" // Series Season Total
        dict["SERIESTITLE"] = "SeriesTitle"
        dict["EPISODENUMBER"] = "5"
        dict["EPISODECOUNT"] = "6"
        dict["SERIESDESCRIPTION"] = "SeriesDescription"
        dict["SERIESSORT"] = "SeriesSort"
        dict["CONTENTRATING"] = "Unrated"
        dict["CONTENTADVISORY"] = "Clean"
        dict["NARRATOR"] = "Narrator"
        dict["LABEL"] = "Label"
        dict["ARRANGER"] = "Arranger"
        dict["ENGINEER"] = "SoundEngineer"
        dict["EXECPRODUCER"] = "ExecutiveProducer"
        dict["DIRECTOR"] = "Director"
        dict["STUDIO"] = "Studio"
        dict["COVERARTIST"] = "CoverArtist"
        dict["SUBTITLE"] = "Subtitle"
        dict["PODCASTDESC"] = "PodcastDescription"
        dict["LONGDESCRIPTION"] = "LongDescription"
        dict["PODCASTCATEGORY"] = "PodcastCategory"
        dict["PODCASTKEYWORDS"] = "PodcastKeywords"
        dict["PODCASTID"] = "PodcastID"
        dict["GENRE"] = "Genre"
        dict["RELEASEDATE"] = "1999-05-08"
        dict["MEDIA"] = "Audiobook"
        dict["TRACKNUMBER"] = "1/2"
        dict["DISCNUMBER"] = "3/4"
        dict["COPYRIGHT"] = "2020 Copyright"
        dict["ALBUMARTIST"] = "AlbumArtist"
        dict["LINERNOTES"] = "LinerNotes"
        dict["ACKNOWLEDGMENT"] = "Acknowledgment"
        dict["THANKS"] = "Thanks"
        dict["CREDITS"] = "Credits"
        dict["LYRICIST"] = "Lyricist"
        dict["LYRICS"] = "Lyrics"
        dict["ALBUMSORT"] = "AlbumSort"
        dict["ARTISTSORT"] = "ArtistSort"
        dict["TITLESORT"] = "TitleSort"
        dict["ALBUMARTISTSORT"] = "AlbumArtistSort"
        dict["CONDUCTOR"] = "Conductor"
        dict["PODCAST"] = "1"
        dict["PODCASTURL"] = "www.podcast.com"
        dict["MOOD"] = "Mood"
        dict["LANGUAGE"] = "und"
        dict["CONTENTGROUP"] = "WorkName"
        
        print(dict)
//        TaglibWrapper.setMetadata("/Users/nolainecrusher/Downloads/audiobook_tools/sampleaax/test/mp3-taglib-test.mp3", dictionary: dict)

        
        
    }
    
}
