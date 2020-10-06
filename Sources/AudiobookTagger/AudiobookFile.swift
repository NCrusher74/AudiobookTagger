//
//  AudiobookFile.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/24/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import SwiftTagger
import Cocoa

/// An audiobook file represents an audiobook file somewhere on disk.
@available(OSX 10.13, *)
struct AudiobookFile {
    
    private var audioFile: SwiftTagger.AudioFile
    public var useComposerForNarrator: Bool
    private var _useITunesGenres: Bool?
    
    init(from location: URL) throws {
        self.audioFile = try AudioFile(location: location)
        if audioFile.composer == nil {
            self.useComposerForNarrator = false
        } else {
            self.useComposerForNarrator = true
        }
    }
    
    
    //MARK: Write
    public func write(outputLocation: URL) throws {
        try audioFile.write(outputLocation: outputLocation)
    }
    
    // MARK: Author
    /// gets and sets the author(s) of the audiobook as a string
    /// uses the Artist tag for both MP3 and MP4
    public var author: String? {
        get { audioFile.artist }
        set { audioFile.artist = newValue }
    }
    
    // MARK: Cover
    /// gets and sets the cover art of the audiobook
    public var coverArt: NSImage? {
        if let art = audioFile.coverArt {
            return art
        } else {
            return nil
        }
    }
    
    public mutating func setCoverArt(imageLocation: URL) throws {
        try audioFile.setCoverArt(imageLocation: imageLocation)
    }
    
    // MARK: Book Title
    /// gets and sets the title of the audiobook as a string
    /// uses the Album tag for both MP3 and MP4
    public var title: String? {
        get { audioFile.album }
        set { audioFile.album = newValue }
    }

    // MARK: ReleaseDate
    /// gets and sets the release date of the audiobook as a date
    /// uses the release date tag for MP4 and recording date tag for MP3
    public var releaseDateTime: Date? {
        get { audioFile.releaseDateTime }
        set { audioFile.releaseDateTime = newValue }
    }
    
    // MARK: Category
    /// gets and set a category tag as a string
    /// uses the Podcast Category tag for MP3 and Category for MP4
    public var category: String? {
        get { audioFile.podcastCategory }
        set { audioFile.podcastCategory = newValue }
    }

    // MARK: Copyright
    /// gets and sets the copyright of the audiobook as a string
    /// uses the Copyright tag for both MP3 and MP4
    public var copyright: String? {
        get { audioFile.copyright }
        set { audioFile.copyright = newValue }
    }

    // MARK: Description
    /// returns a brief description of the audiobook as a string
    /// uses the Comment tag for MP4 and Podcast Description tag for MP3
    public var description: String? {
        get { audioFile.description }
        set { audioFile.description = newValue }
    }

    // MARK: Keywords
    /// gets and sets a keywords tag as an array
    /// uses the Podcast Keywords tag for MP3 and Keywords tag for MP4
    public var keywords: [String] {
        get { audioFile.podcastKeywords }
        set { audioFile.podcastKeywords = newValue }
    }

    // MARK: Media Kind
    /// gets and sets a media kind
    public var mediaKind: Stik? {
        get { audioFile.mediaKind }
        set { audioFile.mediaKind = newValue }
    }

    // MARK: Primary Author
    /// gets and sets the primary author for a multi-author work as a string (for sorting)
    /// uses the AlbumArtist tag for both MP3 and MP4
    public var primaryAuthor: String? {
        get { audioFile.albumArtist }
        set { audioFile.albumArtist = newValue }
    }

    // MARK: Publisher
    /// gets and sets the Publisher tag as a string
    public var publisher: String? {
        get { audioFile.publisher }
        set { audioFile.publisher = newValue }
    }

    // MARK: Series
    public var series: (name: String?, number: Int?, total: Int?) {
        get {
            if let name = self.seriesName {
                if let index = self.seriesIndex {
                    if let total = self.seriesTotal {
                        return (name, index, total)
                    } else {
                        return (name, index, nil)
                    }
                } else {
                    if let total = self.seriesTotal {
                        return (name, nil, total)
                    } else {
                        return (name, nil, nil)
                    }
                }
            } else {
                if let index = self.seriesIndex {
                    if let total = self.seriesTotal {
                        return (nil, index, total)
                    } else {
                        return (nil, index, nil)
                    }
                } else {
                    if let total = self.seriesTotal {
                        return (nil, nil, total)
                    } else {
                        return (nil, nil, nil)
                    }
                }
            }
        }
        set {
            self.seriesIndex = newValue.number
            self.seriesTotal = newValue.total
            self.seriesName = newValue.name
        }
    }
    
    /// gets and sets a string tag intended for grouping of book series
    /// uses the ContentGrouping tag for MP3 and the Grouping tag for MP4
    private var seriesName: String? {
        get { audioFile.grouping }
        set { audioFile.grouping = newValue }
    }
    
    /// gets and sets an integer tag for the current book in a series
    /// uses the TVEpisodeNumber tag for MP4 and a custom tag for MP3
    /// (the custom tag may not be recognized by all players)
    private var seriesIndex: Int? {
        get { audioFile.seriesEpisodeNumber }
        set { audioFile.seriesEpisodeNumber = newValue }
    }

    /// gets and sets an integer tag for the total books in a series
    /// uses the TVSeason tag for MP4 and a custom tag for MP3
    /// (the custom tag may not be recognized by all players)
    private var seriesTotal: Int? {
        get { audioFile.seriesSeason }
        set { audioFile.seriesSeason = newValue }
    }

    // MARK: Part Title
    /// gets and sets a string tag for the title of the current volume of a multi-file/disc work
    /// uses the Title tag for both MP3 and MP4
    public var partTitle: String? {
        get { audioFile.title }
        set { audioFile.title = newValue }
    }

    // MARK: Summary
    /// gets a freeform string tag for longer descriptions
    /// uses the UnsyncedLyrics tag for MP3 and the Lyrics tag for MP4
    public var summary: String? {
        get { audioFile.lyrics }
        set { audioFile.lyrics = newValue }
    }

    // MARK: Universe
    /// gets and sets a string tag intended for grouping multi-series chronologies by the same author(s)
    /// e.g. The Lord of the Rings would be a series in a Middle Earth universe that also includes The Simarillion
    /// uses the Movement Name tag for both MP3 and MP4
    public var universe: (name: String?, number: Int?, total: Int?) {
        get {
            if let name = self.universeName {
                if let index = self.universeIndex {
                    if let total = self.universeTotal {
                        return (name, index, total)
                    } else {
                        return (name, index, nil)
                    }
                } else {
                    if let total = self.universeTotal {
                        return (name, nil, total)
                    } else {
                        return (name, nil, nil)
                    }
                }
            } else {
                if let index = self.universeIndex {
                    if let total = self.universeTotal {
                        return (nil, index, total)
                    } else {
                        return (nil, index, nil)
                    }
                } else {
                    if let total = self.universeTotal {
                        return (nil, nil, total)
                    } else {
                        return (nil, nil, nil)
                    }
                }
            }
        }
        set {
            self.universeIndex = newValue.number
            self.universeTotal = newValue.total
            self.universeName = newValue.name
        }
    }
    
    private var universeName: String? {
        get { audioFile.movement }
        set { audioFile.movement = newValue }
    }

    /// gets and sets an integer tag for the current book in a multi-series chronology
    /// uses the Movement Number tag for MP4 and MP3
    private var universeIndex: Int? {
        get { audioFile.movementNumber }
        set { audioFile.movementNumber = newValue }
    }

    /// gets and sets an integer tag for the total books in a multi-series chronology
    /// uses the Movement Count tag for MP4 and MP3
    private var universeTotal: Int? {
        get { audioFile.movementCount }
        set { audioFile.movementCount = newValue }
    }

    // MARK: Track/Disc
    /// gets and sets an integer tuple for the current and total discs/files in a set
    public var disc: (disc: Int, totalDiscs: Int?) {
        get { audioFile.discNumber }
        set { audioFile.discNumber = newValue }
    }

    /// gets and sets an integer tuple for the current and total tracks in the file
    public var track: (track: Int, totalTracks: Int?) {
        get { audioFile.trackNumber }
        set { audioFile.trackNumber = newValue }
    }
}
