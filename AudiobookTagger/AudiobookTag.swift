//
//  AudioTag.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/27/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation

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
    
}
