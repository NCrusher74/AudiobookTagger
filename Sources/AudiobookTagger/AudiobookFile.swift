//
//  AudiobookFile.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/24/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import SwiftTagger
import SwiftLanguageAndLocaleCodes
import iTunesGenreID
import SwiftConvenienceExtensions
import UniformTypeIdentifiers

/// An audiobook file represents an audiobook file somewhere on disk.
@available(OSX 11.0, iOS 14.0, *)
public struct AudiobookFile {
    public var location: URL
    public var audioFile: SwiftTagger.AudioFile
    public var useComposerForNarrator: Bool
    public let duration: Double
    public var fileType: UTType
    
    public init(from location: URL) throws {
        self.location = location
        self.audioFile = try AudioFile(location: location)
        if let fileType = UTType(location.pathExtension) {
            self.fileType = fileType
        } else {
            throw Error.unknownFileFormat
        }
        
        self.duration = Double(audioFile.length ?? 0)
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
    
    // MARK: - Author
    /// gets and sets the author(s) of the audiobook as a string
    /// uses the Artist tag for both MP3 and MP4
    public var author: String? {
        get { audioFile.artist }
        set { audioFile.artist = newValue }
    }
    
    // MARK: Narrator
    /// gets and sets the narrators of the audiobook as a string
    /// if `useComposerForNarrator` is true, will use `composer` for both MP3 and MP4, otherwise, will use the Audible @nrt atom for MP4 and an entry in the `musicianCreditsList` for `narrator` for MP3
    public var narrator: String? {
        get {
            switch useComposerForNarrator {
                case true:
                    return audioFile.composer
                case false:
                    return audioFile.narrator
            }
        }
        set {
            if let new = newValue {
                switch useComposerForNarrator {
                    case true:
                        audioFile.composer = new
                    case false:
                        audioFile.narrator = new
                }
            } else {
                switch useComposerForNarrator {
                    case true:
                        audioFile.composer = nil
                    case false:
                        audioFile.narrator = nil
                }
            }
        }
    }
    
    // MARK: Cover
    /// gets and sets the cover art of the audiobook
    public var coverArt: NativeImage? {
        if let art = audioFile.coverArt {
            return art
        } else {
            return nil
        }
    }
    
    public mutating func setCoverArt(imageLocation: URL) throws {
        try audioFile.setCoverArt(imageLocation: imageLocation)
    }
    
    public mutating func removeCoverArt() throws {
        try audioFile.removeCoverArt()
    }
    
    // MARK: Book Title
    /// gets and sets the title of the audiobook as a string
    /// uses the Album tag for both MP3 and MP4
    public var title: String? {
        get { audioFile.album }
        set { audioFile.album = newValue }
    }

    public var subtitle: String? {
        get { audioFile.subtitle }
        set { audioFile.subtitle = newValue }
    }

    // MARK: Volume Title
    /// gets and sets a string tag for the title of the current volume of a multi-file/disc work
    /// uses the Title tag for both MP3 and MP4
    public var volumeTitle: String? {
        get { audioFile.title }
        set { audioFile.title = newValue }
    }
    
    // MARK: ReleaseDate
    /// gets and sets the release date of the audiobook as a date
    /// uses the release date tag for MP4 and recording date tag for MP3
    public var releaseDateTime: Date? {
        get {
            if let date = audioFile.releaseDateTime {
                return date
            } else if let date = audioFile.recordingDateTime {
                return date
            } else {
                return nil
            }
        }
        set { audioFile.releaseDateTime = newValue }
    }
    
    // MARK: Audiobook Tyoe
    /// gets and set a category tag as a string
    /// This describes the style of the audiobook, i.e. single narrator, full cast. graphic audio, etc
    /// uses the Podcast Category tag for MP3 and Category for MP4
    public var audiobookType: AudiobookType? {
        get {
            if let string = audioFile.podcastCategory {
                if let category = AudiobookType(rawValue: string) {
                    return category
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                audioFile.podcastCategory = new.rawValue
            } else {
                audioFile.podcastCategory = nil
            }
        }
    }

    // MARK: Copyright
    /// gets and sets the text copyright of the audiobook as a string
    /// this is the copyright for the text, i.e. the actual written book
    /// uses the Copyright tag for both MP3 and MP4
    public var textCopyright: String? {
        get { audioFile.copyright }
        set { audioFile.copyright = newValue }
    }

    /// gets and sets the production copyright of the audiobook as a string
    /// this is the copyright for the audiobook recording
    /// uses the Recording Copyright tag for both MP3 and MP4. For MP3, this is also known as the "Produced Notice" (`TPRO`) frame. for MP4, this is also known as the "Phonogram Rights" (`@phg`) atom
    public var productionCopyright: String? {
        get { audioFile.recordingCopyright }
        set { audioFile.recordingCopyright = newValue }
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
        get { audioFile.artistSort }
        set { audioFile.artistSort = newValue }
    }

    // MARK: Publisher
    /// gets and sets the Publisher tag as a string
    public var publisher: String? {
        get { audioFile.publisher }
        set { audioFile.publisher = newValue }
    }
    
    /// gets and sets a string tag intended for grouping of book series
    /// uses the ContentGrouping tag for MP3 and the Grouping tag for MP4
    public var series: String? {
        get { audioFile.grouping }
        set { audioFile.grouping = newValue }
    }
    
    /// gets and sets an integer tag for the current book in a series
    /// uses the TVEpisodeNumber tag for MP4 and a custom tag for MP3
    /// (the custom tag may not be recognized by all players)
    public var seriesIndex: DblIndex {
        get {
            return DblIndex(index: _seriesIndex ?? 0, total: seriesTotal)
        }
        set {
            _seriesIndex = newValue.index
            seriesTotal = newValue.total
        }
    }
    
    private var _seriesIndex: Double? {
        get {
            if let string = audioFile["seriesIndex"] {
                if let double = Double(string) {
                    return double.decimalPlaces(1)
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                let rounded = new.decimalPlaces(1)
                audioFile["seriesIndex"] = String(rounded)
            } else {
                audioFile["seriesIndex"] = nil
            }
        }
    }

    /// gets and sets an integer tag for the total books in a series
    /// uses the TVSeason tag for MP4 and a custom tag for MP3
    /// (the custom tag may not be recognized by all players)
    private var seriesTotal: Int? {
        get {
            if let string = audioFile["seriesTotal"] {
                if let int = Int(string) {
                    return int
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                audioFile["seriesTotal"] = String(new)
            } else {
                audioFile["seriesTotal"] = nil
            }
        }
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
    public var universe: String? {
        get { audioFile.movement }
        set { audioFile.movement = newValue }
    }

    /// gets and sets an integer tag for the current book in a multi-series chronology
    /// uses the Movement Number tag for MP4 and MP3
    public var universeIndex: DblIndex {
        get {
            return DblIndex(index: _universeIndex ?? 0, total: universeTotal)
        }
        set {
            _universeIndex = newValue.index
            universeTotal = newValue.total
        }
    }
    
    private var _universeIndex: Double? {
        get {
            if let string = audioFile["universeIndex"] {
                if let double = Double(string) {
                    return double
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                audioFile["universeIndex"] = String(new)
            } else {
                audioFile["universeIndex"] = nil
            }
        }
    }

    /// gets and sets an integer tag for the total books in a multi-series chronology
    /// uses the Movement Count tag for MP4 and MP3
    private var universeTotal: Int? {
        get {
            if let string = audioFile["universeTotal"] {
                if let int = Int(string) {
                    return int
                } else {
                    return nil
                }
            } else {
                return nil
            }
        }
        set {
            if let new = newValue {
                audioFile["universeTotal"] = String(new)
            } else {
                audioFile["universeTotal"] = nil
            }
        }
    }

    // MARK: Track/Disc
    /// gets and sets an integer tuple for the current and total discs/files in a set
    public var disc: IntIndex {
        get { audioFile.discNumber }
        set { audioFile.discNumber = newValue }
    }

    /// gets and sets an integer tuple for the current and total tracks in the file
    public var track: IntIndex {
        get { audioFile.trackNumber }
        set { audioFile.trackNumber = newValue }
    }
    
    public var genre: (predefined: Genre?, customGenre: String?) {
        get {
            var pre: Genre? = nil
            if let predefined = audioFile.genrePredefined.mp4 {
                pre = predefined
            }
            var custom: String? = nil
            if let customGenre = audioFile.genreCustom {
                custom = customGenre
            }
            return (pre, custom)
        }
        set {
            if let pre = newValue.predefined {
                audioFile.genrePredefined.mp4 = pre
            } else {
                audioFile.genrePredefined.mp4 = nil
            }
            if let custom = newValue.customGenre {
                audioFile.genreCustom = custom
            } else {
                audioFile.genreCustom = nil
            }
        }
    }
    
    public var languages: [Language] {
        get { return audioFile.language }
        set { audioFile.language = newValue }
    }
    
    public subscript(_ customTag: String) -> String? {
        get {
            return audioFile[customTag]
        }
        set {
            if let new = newValue {
                audioFile[customTag] = new
            } else {
                audioFile[customTag] = nil
            }
        }
    }
    
    public var chapterList: [Chapter] {
        return audioFile.chapterList
    }
    
    public mutating func addChapter(startTime: Int, title: String) {
        audioFile.addChapter(startTime: startTime, title: title)
    }
    
    public mutating func removeChapter(startTime: Int) {
        audioFile.removeChapter(startTime: startTime)
    }
    
    public mutating func removeAllChapters() {
        audioFile.removeAllChapters()
    }
    
    public var titleSort: String? {
        get { audioFile.albumSort }
        set { audioFile.albumSort = newValue }
    }
}
