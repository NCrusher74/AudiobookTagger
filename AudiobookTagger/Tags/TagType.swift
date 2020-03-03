//
//  TagType.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/3/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation

/// The list of tags and variations
struct TagType {
    
    var authors,
    bookTitle,
    title,
    publisher,
    narrators,
    description,
    summary,
    keywords,
    genre,
    copyright,
    category,
    mediaType,
    primaryAuthor,
    series,
    universe,
    track,
    disc,
    releaseDate,
    year,
    seriesIndex,
    seriesTotal,
    universeIndex,
    universeTotal: AudiobookTag
    
    init(authors: AudiobookTag,
         bookTitle: AudiobookTag,
         title: AudiobookTag,
         publisher: AudiobookTag,
         narrators: AudiobookTag,
         description: AudiobookTag,
         summary: AudiobookTag,
         keywords: AudiobookTag,
         genre: AudiobookTag,
         copyright: AudiobookTag,
         category: AudiobookTag,
         mediaType: AudiobookTag,
         primaryAuthor: AudiobookTag,
         series: AudiobookTag,
         universe: AudiobookTag,
         track: AudiobookTag,
         disc: AudiobookTag,
         releaseDate: AudiobookTag,
         year: AudiobookTag,
         seriesIndex: AudiobookTag,
         seriesTotal: AudiobookTag,
         universeIndex: AudiobookTag,
         universeTotal: AudiobookTag) {
        self.authors = authors
        self.bookTitle = bookTitle
        self.category = category
        self.title = title
        self.publisher = publisher
        self.narrators = narrators
        self.description = description
        self.summary = summary
        self.keywords = keywords
        self.genre = genre
        self.copyright = copyright
        self.mediaType = mediaType
        self.primaryAuthor = primaryAuthor
        self.series = series
        self.universe = universe
        self.track = track
        self.disc = disc
        self.releaseDate = releaseDate
        self.year = year
        self.seriesIndex = seriesIndex
        self.seriesTotal = seriesTotal
        self.universeIndex = universeIndex
        self.universeTotal = universeTotal
    }
    
    // possible variations on the actual names of the tags
    // better way to handle this?
    
    /// a variation for the `authors` tag
    var author: AudiobookTag {
        return self.authors
    }
    
    /// a variation for the `narrators` tag
    var narrator: AudiobookTag {
        return self.narrators
    }
    
    /// a variation for the `primaryAuthor` tag
    var mainAuthor: AudiobookTag {
        return self.primaryAuthor
    }
    
    /// a variation for the `description` tag
    var comment: AudiobookTag {
        return description
    }
    
    /// a variation for the `summary` tag
    var lyrics: AudiobookTag {
        return self.summary
    }
            
    
}
