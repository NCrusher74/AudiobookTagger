//
//  AudiobookFile.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/24/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import MP42Foundation
import ID3TagEditor

/// An audiobook file represents an audiobook file somewhere on disk.
///
/// This wrapper houses methods for querying or modifying information about the file.
struct AudiobookFile {
    
    /// the filepath of the audiobook file
    let audiobookUrl: URL
    
    init(from audiobookUrl: URL) {
        self.audiobookUrl = audiobookUrl
    }
    
    /// the format of the audiobook file
    var format: AudiobookType {
        let audiobookExtension = self.audiobookUrl.pathExtension
        let mp4types: [String] = ["aac", "mp4", "m4b", "m4a"]
        
        if mp4types.contains(audiobookExtension.lowercased()) {
            return AudiobookType.mp4
        } else if audiobookExtension.lowercased() == "mp3" {
            return AudiobookType.mp3
        } else {
            return AudiobookType.invalid
        }
    }
    
    func read(tag: AudiobookTag) throws -> Any {
        switch tag {
            case .authors :
                let tag = AuthorTag(audiobookFile: self)
                return try tag.returnAuthorMetadata()
            case .bookTitle :
                let tag = BookTitleTag(audiobookFile: self)
                return try tag.returnBookTitleMetadata()
            case .primaryAuthor:
                let tag = PrimaryAuthorTag(audiobookFile: self)
                return try tag.returnPrimaryAuthorMetadata()
            case .description:
                let tag = DescriptionTag(audiobookFile: self)
                return try tag.returnDescriptionMetadata()
            case .narrators:
                let tag = NarratorTag(audiobookFile: self)
                return try tag.returnNarratorMetadata()
            case .series:
                let tag = SeriesTitleTag(audiobookFile: self)
                return try tag.returnSeriesTitleMetadata()
            case .copyright:
                let tag = CopyrightTag(audiobookFile: self)
                return try tag.returnCopyrightMetadata()
            case .disc:
                let tag = DiscTag(audiobookFile: self)
                return try tag.returnDiscMetadata()
            case .genre:
                let tag = GenreTag(audiobookFile: self)
                return try tag.returnGenreMetadata()
            case .summary:
                let tag = SummaryTag(audiobookFile: self)
                return try tag.returnSummaryMetadata()
            case .mediaType:
                let tag = MediaTypeTag(audiobookFile: self)
                return try tag.returnMediaTypeMetadata()
            case .universe:
                let tag = UniverseTitleTag(audiobookFile: self)
                return try tag.returnUniverseTitleMetadata()
            case .universeIndex:
                let tag = UniverseIndexTag(audiobookFile: self)
                return try tag.returnUniverseIndexMetadata()
            case .category:
                let tag = CategoryTag(audiobookFile: self)
                return try tag.returnCategoryMetadata()
            case .keywords:
                let tag = KeywordsTag(audiobookFile: self)
                return try tag.returnKeywordsMetadata()
            case .publisher:
                let tag = PublisherTag(audiobookFile: self)
                return try tag.returnPublisherMetadata()
            case .releaseDate:
                let tag = ReleaseDateTag(audiobookFile: self)
                return try tag.returnReleaseDateMetadata() as Any
            case .seriesIndex:
                let tag = SeriesIndexTag(audiobookFile: self)
                return try tag.returnSeriesIndexMetadata()
            case .title:
                let tag = TitleTag(audiobookFile: self)
                return try tag.returnTitleMetadata()
            case .track:
                let tag = TrackTag(audiobookFile: self)
                return try tag.returnTrackMetadata()
            case .year:
                let tag = YearTag(audiobookFile: self)
                return try tag.returnReleaseYearMetadata() as Any
        }
    }
    
}
