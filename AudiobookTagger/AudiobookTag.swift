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

enum AudiobookTag {
    
    /// ID3 tag TALB / MP4 tag ©alb
    case bookTitle
    /// ID3 tag TPE2 / MP4 tag aART
    case primaryAuthor
    /// ID3 tag TPE1 / MP4 tag ©art
    case authors
    /// ID3 tag COMM / MP4 tag ©cmt
    case briefDescription
    /// ID3 tag TCOM / MP4 tag ©wrt
    case narrators
    /// ID3 tag TPE3 / MP4 tag ©con
    case series
    /// ID3 tag TCOP / MP4 tag cprt
    case copyright
    /// ID3 tag TPOS / MP4 tag disk
    case disc
    /// ID3 tag TCON / MP4 tag ©gen
    case genre
    /// ID3 tag USLT / MP4 tag ©lyr
    case fullSummary
    /// ID3 tag TMED / MP4 tag stik
    case mediaType
    /// ID3 tag MVNM / MP4 tag ©mvn
    case universe
    /// ID3 tag MVIN / MP4 tag ©mvi (and ©mvc)
    case universeIndex
    /// Total volumes in Universe
    case universeTotal
    /// ID3 tag TCAT / MP4 tag catg
    case category
    /// ID3 tag TKWD / MP4 tag keyw
    case keywords
    /// ID3 tag TPUB / MP4 tag ©pub
    case publisher
    /// ID3 tag TDRL / MP4 tag rldt
    case releaseDate
    /// ID3 tag TXXX / MP4 tag tves (and tvsn)
    case seriesIndex
    /// Total Books in Series
    case seriesTotal
    /// ID3 tag TIT2 / MP4 tag ©nam
    case chapterTitle
    /// ID3 tag TRCK / MP4 tag trkn
    case track
    /// ID3 tag TYER / MP4 tag ©day
    case year
    

    /// the ID3TagEditor FrameName for the audiobook tag
    var id3Tag: FrameName {
        switch self {
            case .authors :
                return .Artist
            case .bookTitle :
                return .Album
            case .briefDescription :
                return .Comment
            case .category :
                return .PodcastCategory
            case .chapterTitle :
                return .Title
            case .copyright :
                return .Copyright
            case .disc :
                return .DiscPosition
            case .fullSummary :
                return .UnsyncedLyrics
            case .genre :
                return .Genre
            case .keywords :
                return .PodcastKeywords
            case .mediaType :
                return .MediaType
            case .narrators :
                return .Composer
            case .primaryAuthor :
                return .AlbumArtist
            case .publisher :
                return .Publisher
            case .releaseDate :
                return .RecordingDayMonth
            case .series :
                return .ContentGrouping
            case .seriesIndex :
                return .SeriesIndex
            case .track :
                return .TrackPosition
            case .universe :
                return .MovementName
            case .universeIndex :
                return .MovementIndex
            case .year :
                return .RecordingYear
            case .seriesTotal :
                return .SeriesIndex
            case .universeTotal :
                return .MovementIndex
        }
    }
    
    /// the MP4 Foundation identifier string for the audiobook tag
    var mp4Tag: String {
        var identifier: String
        switch self {
            case .authors :
                identifier = MP42MetadataKeyArtist
            case .bookTitle :
                identifier = MP42MetadataKeyAlbum
            case .briefDescription :
                identifier = MP42MetadataKeyUserComment
            case .category :
                identifier = MP42MetadataKeyCategory
            case .chapterTitle :
                identifier = MP42MetadataKeyName
            case .copyright :
                identifier = MP42MetadataKeyCopyright
            case .disc :
                identifier = MP42MetadataKeyDiscNumber
            case .fullSummary :
                identifier = MP42MetadataKeyLyrics
            case .genre :
                identifier = MP42MetadataKeyUserGenre
            case .keywords :
                identifier = MP42MetadataKeyKeywords
            case .mediaType :
                identifier = MP42MetadataKeyMediaKind
            case .narrators :
                identifier = MP42MetadataKeyComposer
            case .primaryAuthor :
                identifier = MP42MetadataKeyAlbumArtist
            case .publisher :
                identifier = MP42MetadataKeyPublisher
            case .releaseDate :
                identifier = MP42MetadataKeyReleaseDate
            case .series :
                identifier = MP42MetadataKeyGrouping
            case .seriesIndex :
                identifier = MP42MetadataKeyTVEpisodeNumber
            case .seriesTotal :
                identifier = MP42MetadataKeyTVSeason
            case .track :
                identifier = MP42MetadataKeyTrackNumber
            case .universe :
                identifier = MP42MetadataKeyMovementName
            case .universeIndex :
                identifier = MP42MetadataKeyMovementNumber
            case .universeTotal :
                identifier = MP42MetadataKeyMovementCount
            case .year :
                identifier = MP42MetadataKeyReleaseDate
        }
        return identifier
    }
    
    
    
}
