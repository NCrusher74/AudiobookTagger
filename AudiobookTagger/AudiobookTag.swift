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
    case BookTitle
    /// ID3 tag TPE2 / MP4 tag aART
    case PrimaryAuthor
    /// ID3 tag TPE1 / MP4 tag ©art
    case Authors
    /// ID3 tag COMM / MP4 tag ©cmt
    case BriefDescription
    /// ID3 tag TCOM / MP4 tag ©wrt
    case Narrator
    /// ID3 tag TPE3 / MP4 tag ©con
    case Series
    /// ID3 tag TCOP / MP4 tag cprt
    case Copyright
    /// ID3 tag TPOS / MP4 tag disk
    case Disc
    /// ID3 tag TCON / MP4 tag ©gen
    case Genre
    /// ID3 tag USLT / MP4 tag ©lyr
    case FullSummary
    /// ID3 tag TMED / MP4 tag stik
    case MediaType
    /// ID3 tag MVNM / MP4 tag ©mvn
    case Universe
    /// ID3 tag MVIN / MP4 tag ©mvi (and ©mvc)
    case UniverseIndex
    /// ID3 tag TCAT / MP4 tag catg
    case Category
    /// ID3 tag TKWD / MP4 tag keyw
    case Keywords
    /// ID3 tag TPUB / MP4 tag ©pub
    case Publisher
    /// ID3 tag TDRL / MP4 tag rldt
    case ReleaseDate
    /// (Audiobook Use Only) ID3 tag TXXX / MP4 tag tves (and tvsn)
    case SeriesIndex
    /// ID3 tag TIT2 / MP4 tag ©nam
    case ChapterTitle
    /// ID3 tag TRCK / MP4 tag trkn
    case Track
    /// ID3 tag TYER / MP4 tag ©day
    case Year
    

    var id3tag: FrameName {
        switch self {
            case .Authors :
                return .Artist
            case .BookTitle :
                return .Album
            case .BriefDescription :
                return .Comment
            case .Category :
                return .PodcastCategory
            case .ChapterTitle :
                return .Title
            case .Copyright :
                return .Copyright
            case .Disc :
                return .DiscPosition
            case .FullSummary :
                return .UnsyncedLyrics
            case .Genre :
                return .Genre
            case .Keywords :
                return .PodcastKeywords
            case .MediaType :
                return .MediaType
            case .Narrator :
                return .Composer
            case .PrimaryAuthor :
                return .AlbumArtist
            case .Publisher :
                return .Publisher
            case .ReleaseDate :
                return .RecordingDayMonth
            case .Series :
                return .ContentGrouping
            case .SeriesIndex :
                return .SeriesIndex
            case .Track :
                return .TrackPosition
            case .Universe :
                return .MovementName
            case .UniverseIndex :
                return .MovementIndex
            case .Year :
                return .RecordingYear
        }
    }
    
    var mp4Tag: String {
        var identifier: String
        switch self {
            case .Authors :
                identifier = MP42MetadataKeyArtist
            case .BookTitle :
                identifier = MP42MetadataKeyAlbum
            case .BriefDescription :
                identifier = MP42MetadataKeyUserComment
            case .Category :
                identifier = MP42MetadataKeyCategory
            case .ChapterTitle :
                identifier = MP42MetadataKeyName
            case .Copyright :
                identifier = MP42MetadataKeyCopyright
            case .Disc :
                identifier = MP42MetadataKeyDiscNumber
            case .FullSummary :
                identifier = MP42MetadataKeyLyrics
            case .Genre :
                identifier = MP42MetadataKeyUserGenre
            case .Keywords :
                identifier = MP42MetadataKeyKeywords
            case .MediaType :
                identifier = MP42MetadataKeyMediaKind
            case .Narrator :
                identifier = MP42MetadataKeyComposer
            case .PrimaryAuthor :
                identifier = MP42MetadataKeyAlbumArtist
            case .Publisher :
                identifier = MP42MetadataKeyPublisher
            case .ReleaseDate :
                identifier = MP42MetadataKeyReleaseDate
            case .Series :
                identifier = MP42MetadataKeyGrouping
            case .SeriesIndex :
                identifier = "\(MP42MetadataKeyTVEpisodeNumber) of \(MP42MetadataKeyTVSeason)"
            case .Track :
                identifier = MP42MetadataKeyTrackNumber
            case .Universe :
                identifier = MP42MetadataKeyMovementName
            case .UniverseIndex :
                identifier = "\(MP42MetadataKeyMovementNumber) of \(MP42MetadataKeyMovementCount)"
            case .Year :
                identifier = MP42MetadataKeyReleaseDate
        }
        return identifier
    }
    
    
    
}
