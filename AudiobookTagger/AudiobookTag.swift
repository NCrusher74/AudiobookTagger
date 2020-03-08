//
//  AudioTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/27/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import ID3TagEditor
import MP42Foundation
import OutcastID3

/// An audiobook tag represents a structure (ID3 Frame or MP4 atom) containing metadata in the file.
///
/// This enum handles queries and methods pertaining to the tags

enum AudiobookTag {
    
    /// ID3 tag TPE1 / MP4 tag ©art
    /// string output
    case authors
    /// ID3 tag TALB / MP4 tag ©alb
    /// string output
    case bookTitle
    /// ID3 tag TCAT / MP4 tag catg
    /// string output
    case category
    /// ID3 tag TCOP / MP4 tag cprt
    /// string output
    case copyright
    /// ID3 tag COMM / MP4 tag ©cmt
    /// string output
    case description
    /// ID3 tag TPOS / MP4 tag disk
    /// ID3 output: "## of ##"
    /// MP4 output: [Int]
    case disc
    /// ID3 tag TCON / MP4 tag ©gen
    /// string output
    case genre
    /// ID3 tag TKWD / MP4 tag keyw
    /// string output
    case keywords
    /// ID3 tag TMED / MP4 tag stik
    /// string output
    case mediaType
    /// ID3 tag TCOM / MP4 tag ©wrt
    /// string output
    case narrators
    /// ID3 tag TPE2 / MP4 tag aART
    /// string output
    case primaryAuthor
    /// ID3 tag TPUB / MP4 tag ©pub
    /// string output
    case publisher
    /// ID3 tag TDRL / MP4 tag rldt
    /// ID3 output: Int, Int (Day, Month)
    /// MP4 output: String
    case releaseDate
    /// ID3 tag TPE3 / MP4 tag ©con
    /// string output
    case series
    /// ID3 tag SRSI / MP4 tag tves
    /// Int output
    case seriesIndex
    /// ID3 tag SRSC / MP4 tag tvsn
    /// Int output
    case seriesTotal
    /// ID3 tag USLT / MP4 tag ©lyr
    /// string output
    case summary
    /// ID3 tag TIT2 / MP4 tag ©nam
    /// string output
    case title
    /// ID3 tag TRCK / MP4 tag trkn
    /// ID3 output: "## of ##"
    /// MP4 output: [Int]
    case track
    /// ID3 tag MVNM / MP4 tag ©mvn
    /// string output
    case universe
    /// ID3 tag MVIN / MP4 tag ©mvi
    /// Int Output
    case universeIndex
    /// ID3 tag MVCN / MP4 tag ©mvc
    /// Int Output
    case universeTotal
        
    init() {
        self = .authors
        self = .bookTitle
        self = .category
        self = .copyright
        self = .description
        self = .disc
        self = .genre
        self = .keywords
        self = .mediaType
        self = .narrators
        self = .primaryAuthor
        self = .publisher
        self = .releaseDate
        self = .series
        self = .seriesIndex
        self = .seriesTotal
        self = .summary
        self = .title
        self = .track
        self = .universe
        self = .universeIndex
        self = .universeTotal
    }

    /// the ID3TagEditor FrameName for the audiobook tag
    var id3Tag: FrameName {
        switch self {
            case .authors :
                return .Artist                                  // String
            case .bookTitle :
                return .Album                                   // String
            case .description :
                return .PodcastDescription                      // String
            case .category :
                return .PodcastCategory                         // String
            case .title :
                return .Title                                   // String
            case .copyright :
                return .Copyright                               // String
            case .disc :
                return .DiscPosition                            // String ("Int of Int?")
            case .summary :
                return .UnsyncedLyrics                          // String
            case .genre :
                return .Genre                                   // String
            case .keywords :
                return .PodcastKeywords                         // String
            case .mediaType :
                return .MediaType                               // String
            case .narrators :
                return .Composer                                // String
            case .primaryAuthor :
                return .AlbumArtist                             // String
            case .publisher :
                return .Publisher                               // String
            case .releaseDate :
                return .RecordingDateTime                       // Int, Int (Day, Month)
            case .series :
                return .ContentGrouping                         // String
            case .seriesIndex :
                return .SeriesIndex                             // Int
            case .seriesTotal :
                return .SeriesCount                             // Int
            case .track :
                return .TrackPosition                           // String ("Int of Int?")
            case .universe :
                return .MovementName                            //String
            case .universeIndex :
                return .MovementIndex                           // Int
            case .universeTotal :
                return .MovementCount                           // Int
        }
    }
    
    /// the MP4 Foundation identifier string for the audiobook tag
    var mp4Tag: String {
        var identifier: String
        switch self {
            case .authors :
                identifier = MP42MetadataKeyArtist              // String
            case .bookTitle :
                identifier = MP42MetadataKeyAlbum               // String
            case .description :
                identifier = MP42MetadataKeyUserComment         // String
            case .category :
                identifier = MP42MetadataKeyCategory            // String
            case .title :
                identifier = MP42MetadataKeyName                // String
            case .copyright :
                identifier = MP42MetadataKeyCopyright           // String
            case .disc :
                identifier = MP42MetadataKeyDiscNumber          // [Int]
            case .summary :
                identifier = MP42MetadataKeyLyrics              // String
            case .genre :
                identifier = MP42MetadataKeyUserGenre           // String
            case .keywords :
                identifier = MP42MetadataKeyKeywords            // String
            case .mediaType :
                identifier = MP42MetadataKeyMediaKind           // Int
            case .narrators :
                identifier = MP42MetadataKeyComposer            // String
            case .primaryAuthor :
                identifier = MP42MetadataKeyAlbumArtist         // String
            case .publisher :
                identifier = MP42MetadataKeyPublisher           // String
            case .releaseDate :
                identifier = MP42MetadataKeyReleaseDate         // String
            case .series :
                identifier = MP42MetadataKeyGrouping            // String
            case .seriesIndex :
                identifier = MP42MetadataKeyTVEpisodeNumber     // Int
            case .seriesTotal :
                identifier = MP42MetadataKeyTVSeason            // Int
            case .track :
                identifier = MP42MetadataKeyTrackNumber         // [Int]
            case .universe :
                identifier = MP42MetadataKeyMovementName        // String
            case .universeIndex :
                identifier = MP42MetadataKeyMovementNumber      // Int
            case .universeTotal :
                identifier = MP42MetadataKeyMovementCount       // Int
        }
        return identifier
    }
    
    
    
    
    
    
}
