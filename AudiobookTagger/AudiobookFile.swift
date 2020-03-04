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
    
    // MARK: Properties
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
    
    // MARK: Author
    /// returns the author(s) of the audiobook as a string
    /// uses the Artist tag for both MP3 and MP4
    public func authors() throws -> String {
        return string(for: .authors)
    }
    /// adds the author(s) to the tag output as a string
    /// uses the Artist tag for both MP3 and MP4
    public mutating func setAuthors(authors: String) throws {
        set(.authors, to: authors)
    }
    // MARK: Book Title
    /// returns the title of the audiobook as a string
    /// uses the Album tag for both MP3 and MP4
    public func bookTitle() throws -> String {
        return string(for: .bookTitle)
    }
    /// adds the bookTitle to the tag output as a string
    /// uses the Album tag for both MP3 and MP4
    public mutating func setBookTitle(bookTitle: String) throws {
        set(.bookTitle, to: bookTitle)
    }
    // MARK: ReleaseDate
    /// returns the release date of the audiobook as a date
    /// uses the release date tag for MP4 and recording date tag for MP3
    public func releaseDate() throws -> Date {
        return date(for: .releaseDate)
    }
    /// adds the release date to the tag output as a date
    /// uses the release date tag for MP4 and recording date tag for MP3
    public mutating func setReleaseDate(date: Date) throws {
        set(.releaseDate, to: date)
    }
    /// returns an integer tag for the year of the audiobook's release
    public func year() throws -> Int {
        return integer(for: .year)
    }
    /// adds an integer tag to the tag output for the position of the total books in a multi-series work
    public mutating func setYear(year: Int) throws {
        set(.year, to: year)
    }
    // MARK: Category
    /// returns a category tag as a string, which can be implemented as desired
    /// uses the Podcast Category tag for MP3 and Category for MP4
    public func category() throws -> String {
        return string(for: .category)
    }
    /// adds a category tag to the tag output as a string
    /// uses the Podcast Category tag for MP3 and Category for MP4
    public mutating func setCategory(category: String) throws {
        set(.category, to: category)
    }
    // MARK: Copyright
    /// returns the copyright of the audiobook as a string
    /// uses the Copyright tag for both MP3 and MP4
    public func copyright() throws -> String {
        return string(for: .copyright)
    }
    /// adds a copyright tag to the tag output as a string
    /// uses the Copyright tag for both MP3 and MP4
    public mutating func setCopyright(copyright: String) throws {
        set(.copyright, to: copyright)
    }
    // MARK: Description
    /// returns a brief description of the audiobook as a string
    /// uses the Comment tag for MP4 and Podcast Description tag for MP3
    public func description() throws -> String {
        return string(for: .description)
    }
    /// adds a description tag to the tag output as a string
    /// uses the Comment tag for MP4 and Podcast Description tag for MP3
    public mutating func setDescription(description: String) throws {
        set(.description, to: description)
    }
    // MARK: Genre
    /// returns a genre tag as a string, which can be implemented as desired
    /// uses the freeform version of the Genre tag for both MP3 and MP4
    public func genre() throws -> String {
        return string(for: .genre)
    }
    /// adds a genre tag to the tag output as a string
    /// uses the freeform version of the Genre tag for both MP3 and MP4
    public mutating func setGenre(genre: String) throws {
        set(.genre, to: genre)
    }
    // MARK: Keywords
    /// returns a keywords tag as a string, which can be implemented as desired
    /// uses the Podcast Keywords tag for MP3 and Keywords tag for MP4
    public func keywords() throws -> String {
        return string(for: .keywords)
    }
    /// adds a keywords tag to the tag output as a string
    /// uses the Podcast Keywords tag for MP3 and Keywords tag for MP4
    public mutating func setKeywords(keywords: String) throws {
        set(.keywords, to: keywords)
    }
    // MARK: Media Type
    /// returns a mediaType tag as a string, which can be implemented as desired
    /// uses the Media Type tag for both MP3 and MP4.
    /// Since Media Type (stik) is actually an integer for MP4, valid options are only Audiobook (2), Podcast (21), or Booklet (11) unless your implementation customizes the return further.
    public func mediaType() throws -> String {
        return string(for: .mediaType)
    }
    /// adds a mediaType tag to the tag output
    /// uses the Media Type tag for both MP3 and MP4.
    /// Since Media Type (stik) is actually an integer for MP4, valid options are only Audiobook (2), Podcast (21), or Booklet (11) unless your implementation customizes the return further.
    public mutating func setMediaType(mediaType: String) throws {
        set(.mediaType, to: mediaType)
    }
    // MARK: Narrators
    /// returns the narrator(s) of the audiobook as a string
    /// uses the Composer tag for both MP3 and MP4
    public func narrators() throws -> String {
        return string(for: .narrators)
    }
    /// adds a narrators tag to the tag output as a string
    /// uses the Composer tag for both MP3 and MP4
    public mutating func setNarrators(narrators: String) throws {
        set(.narrators, to: narrators)
    }
    // MARK: Primary Author
    /// returns the primary author for a multi-author work as a string (for sorting)
    /// uses the AlbumArtist tag for both MP3 and MP4
    public func primaryAuthor() throws -> String {
        return string(for: .primaryAuthor)
    }
    /// adds a primaryAuthor tag to the tag output as a string
    /// uses the AlbumArtist tag for both MP3 and MP4
    public mutating func setPrimaryAuthor(primaryAuthor: String) throws {
        set(.primaryAuthor, to: primaryAuthor)
    }
    // MARK: Publisher
    /// returns the Publisher tag as a string
    public func publisher() throws -> String {
        return string(for: .publisher)
    }
    /// adds a publisher tag to the tag output as a string
    public mutating func setPublisher(publisher: String) throws {
        set(.publisher, to: publisher)
    }
    // MARK: Series
    /// returns a string tag intended for grouping of book series
    /// uses the ContentGrouping tag for MP3 and the Grouping tag for MP4
    public func series() throws -> String {
        return string(for: .series)
    }
    /// adds a series title tag to the tag output as a string
    /// uses the ContentGrouping tag for MP3 and the Grouping tag for MP4
    public mutating func setSeries(series: String) throws {
        set(.series, to: series)
    }
    /// returns an integer tag for the current book in a series
    /// uses the TVEpisodeNumber tag for MP4 and a custom tag for MP3
    /// (the custom tag may not be recognized by all players)
    public func seriesIndex() throws -> Int {
        return integer(for: .seriesIndex)
    }
    /// adds an integer tag to the tag output for the position of the current book in a series
    /// uses the TVEpisodeNumber tag for MP4 and a custom tag for MP3
    /// (the custom tag may not be recognized by all players)
    public mutating func setSeriesIndex(index: Int) throws {
        set(.seriesIndex, to: index)
    }
    /// returns an integer tag for the total books in a series
    /// uses the TVSeason tag for MP4 and a custom tag for MP3
    /// (the custom tag may not be recognized by all players)
    public func seriesTotal() throws -> Int {
        return integer(for: .seriesTotal)
    }
    /// adds an integer tag to the tag output for the total books in a series
    /// uses the TVSeason tag for MP4 and a custom tag for MP3
    /// (the custom tag may not be recognized by all players)
    public mutating func setSeriesTotal(total: Int) throws {
        set(.seriesTotal, to: total)
    }
    // MARK: Title
    /// returns a string tag for labeling the current volume of a multi-file/disc work
    /// uses the Title tag for both MP3 and MP4
    public func title() throws -> String {
        return string(for: .title)
    }
    /// adds a string tag for labeling the current volume of multi-file/disc work
    /// uses the Title tag for both MP3 and MP4
    public mutating func setTitle(title: String) throws {
        set(.title, to: title)
    }
    // MARK: Summary
    /// returns a freeform string tag for longer descriptions
    /// uses the UnsyncedLyrics tag for MP3 and the Lyrics tag for MP4
    public func summary() throws -> String {
        return string(for: .summary)
    }
    /// adds a freeform string tag for longer descriptions to the tag output
    /// uses the UnsyncedLyrics tag for MP3 and the Lyrics tag for MP4
    public mutating func setSummary(summary: String) throws {
        set(.summary, to: summary)
    }
    // MARK: Universe
    /// returns a string tag intended for grouping multi-series chronologies by the same author(s)
    /// e.g. The Lord of the Rings would be a series in a Middle Earth universe that also includes The Simarillion
    /// uses the Movement Name tag for both MP3 and MP4
    public func universe() throws -> String {
        return string(for: .universe)
    }
    /// adds a string tag to the tag output, intended for grouping multi-series chronologies by the same author(s)
    /// e.g. The Lord of the Rings would be a `series` in a Middle Earth `universe` that also includes The Simarillion
    /// uses the Movement Name tag for both MP3 and MP4
    public mutating func setUniverse(universe: String) throws {
        set(.universe, to: universe)
    }
    /// returns an integer tag for the current book in a multi-series chronology
    /// uses the Movement Number tag for MP4 and MP3
    public func universeIndex() throws -> Int {
        return integer(for: .universeIndex)
    }
    /// adds an integer tag to the tag output for the position of the current book in a multi-series work
    /// uses the Movement Number tag for MP4 and MP3
    public mutating func setUniverseIndex(index: Int) throws {
        set(.universeIndex, to: index)
    }
    /// returns an integer tag for the total books in a multi-series chronology
    /// uses the Movement Count tag for MP4 and MP3
    public func universeTotal() throws -> Int {
        return integer(for: .universeTotal)
    }
    /// adds an integer tag to the tag output for the total books in a multi-series work
    /// uses the Movement Count tag for MP4 and MP3
    public mutating func setUniverseTotal(total: Int) throws {
        set(.universeTotal, to: total)
    }
    // MARK: Track/Disc
    /// returns an integer array for the current and total discs/files in a set
    public func disc() throws -> [Int] {
        return intArray(for: .disc)
    }
    /// adds an integer array tag to the tag output for the current and total discs/files in a set
    public mutating func setDisc(disc: [Int]) throws {
        set(.disc, to: disc)
    }
    /// returns an integer array for the current and total tracks in the file
    public func track() throws -> [Int] {
        return intArray(for: .track)
    }    
    /// adds an integer array tag to the tag output for current and total tracks in the file
    public mutating func setTrack(track: [Int]) throws {
        set(.track, to: track)
    }
    //MARK: Write
    public func write(outputUrl: URL) throws {
        switch self.format {
            case .mp3 :
                let id3TagEditor = ID3TagEditor()
                try id3TagEditor.write(
                    tag: id3Tag,
                    to: self.audiobookUrl.path,
                    andSaveTo: outputUrl.path)
            case .mp4 :
                let mp42File = try MP42File(url: self.audiobookUrl)
                mp42File.metadata.addItems(mp42MetadataItemArray)
                try mp42File.write(to: outputUrl, options: nil)
            case .invalid :
                print("output file is not format handled by Audiobook Tagger")
        }
    }
    
    // MARK: Reading Helper Functions
    private func string(for tag: AudiobookTag) -> String {
        let stringTags: [AudiobookTag] = [
            .authors,
            .bookTitle,
            .category,
            .copyright,
            .description,
            .keywords,
            .mediaType,
            .narrators,
            .primaryAuthor,
            .publisher,
            .series,
            .summary,
            .title,
            .universe,
            .genre
        ]
        if stringTags.contains(tag) {
            do {
                switch self.format {
                    case .mp3:
                        let id3TagEditor = ID3TagEditor()
                        if tag == .genre {
                            if let id3Tag = try id3TagEditor.read(from: self.audiobookUrl.path) {
                                return (id3Tag.frames[AudiobookTag.genre.id3Tag] as?
                                    ID3FrameGenre)?.description ?? ""
                            }
                        } else if let id3Tag = try id3TagEditor.read(from: self.audiobookUrl.path) {
                            return (id3Tag.frames[tag.id3Tag] as? ID3FrameWithStringContent)?
                                .content ?? ""
                    }
                    case .mp4:
                        let mp4File = try MP42File(url: self.audiobookUrl)
                        if tag == .mediaType {
                            let returnInt = mp4File.metadata.metadataItemsFiltered(
                                byIdentifier: tag.mp4Tag).first?.numberValue
                            if returnInt == 2 {
                                return "Audiobook"
                            } else if returnInt == 21 {
                                return "Podcast"
                            } else if returnInt == 11 {
                                return "Periodical"
                            } else {
                                return ""
                            }
                        } else {
                            return mp4File.metadata.metadataItemsFiltered(byIdentifier: tag.mp4Tag).first?.stringValue ?? ""
                    }
                    case .invalid :
                        print("output file is not format handled by Audiobook Tagger")
                }
            } catch { print("error reading string-formatted tag") }
        }; return ""
    }
    
    private func integer(for tag: AudiobookTag) -> Int {
        let intTags: [AudiobookTag] = [
            .seriesIndex,
            .seriesTotal,
            .universeIndex,
            .universeTotal,
        ]
        if intTags.contains(tag) {
            do {
                switch self.format {
                    case .mp3:
                        let id3TagEditor = ID3TagEditor()
                        if let id3Tag = try id3TagEditor.read(from: self.audiobookUrl.path) {
                            return (id3Tag.frames[tag.id3Tag] as? ID3FrameWithIntegerContent)?.value ?? 0
                    }
                    case .mp4:
                        let mp4File = try MP42File(url: self.audiobookUrl)
                        return (mp4File.metadata.metadataItemsFiltered(
                            byIdentifier: tag.mp4Tag).first?.numberValue) as! Int
                    
                    case .invalid :
                        print("output file is not format handled by Audiobook Tagger")
                }
            } catch { print("error reading integer-formatted tag") }
        } else if tag == .year {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(identifier: "UTC")
            do {
                switch self.format {
                    case .mp3 :
                        let id3TagEditor = ID3TagEditor()
                        if let id3Tag = try id3TagEditor.read(from: self.audiobookUrl.path) {
                            return (id3Tag.frames[AudiobookTag.year.id3Tag] as?
                                ID3FrameRecordingYear)?.year ?? 0000
                    }
                    case .mp4 :
                        let mp4File = try MP42File(url: self.audiobookUrl)
                        if let mp4Date = (mp4File.metadata.metadataItemsFiltered(
                            byIdentifier: MP42MetadataKeyReleaseDate).first?.dateValue) {
                            let calendar = Calendar.current
                            return calendar.component(.year, from: mp4Date)
                    }
                    case .invalid :
                        print("output file is not format handled by Audiobook Tagger")
                }
            } catch { print("error reading date tag") }
        }; return 0
    }
    
    private func intArray(for tag: AudiobookTag) -> [Int] {
        let intArrayTags: [AudiobookTag] = [
            .disc,
            .track,
        ]
        if intArrayTags.contains(tag) {
            do {
                switch self.format {
                    case .mp3:
                        let id3TagEditor = ID3TagEditor()
                        var partTotalArray: [Int] = []
                        if let id3Tag = try id3TagEditor.read(from: self.audiobookUrl.path) {
                            if let part = (id3Tag.frames[tag.id3Tag] as?
                                ID3FramePartOfTotal)?.part {
                                partTotalArray.append(part)
                            }
                            if let total = (id3Tag.frames[tag.id3Tag] as?
                                ID3FramePartOfTotal)?.total {
                                partTotalArray.append(total)
                            }
                            return partTotalArray
                    }
                    case .mp4:
                        let mp4File = try MP42File(url: self.audiobookUrl)
                        return mp4File.metadata.metadataItemsFiltered(
                            byIdentifier: tag.mp4Tag).first?.arrayValue as! [Int]
                    
                    case .invalid :
                        print("output file is not format handled by Audiobook Tagger")
                }
            } catch { print("error reading array tag") }
        }; return []
    }
    
    private func date(for tag: AudiobookTag) -> Date {
        if tag == .releaseDate {
            do {
                switch self.format {
                    case .mp3:
                        let id3TagEditor = ID3TagEditor()
                        if let id3Tag = try id3TagEditor.read(from: self.audiobookUrl.path) {
                            var day: Int?
                            var month: Int?
                            var year: Int?
                            if (id3Tag.frames[tag.id3Tag] as?
                                ID3FrameRecordingDayMonth)?.day != 0 {
                                day = (id3Tag.frames[tag.id3Tag] as?
                                    ID3FrameRecordingDayMonth)?.day
                            }
                            if (id3Tag.frames[tag.id3Tag] as?
                                ID3FrameRecordingDayMonth)?.month != 0 {
                                month = (id3Tag.frames[tag.id3Tag] as?
                                    ID3FrameRecordingDayMonth)?.month
                            }
                            if (id3Tag.frames[AudiobookTag.year.id3Tag] as?
                                ID3FrameRecordingYear)?.year != 0 {
                                year = (id3Tag.frames[AudiobookTag.year.id3Tag] as?
                                    ID3FrameRecordingYear)?.year
                            }
                            let dateString = "\(month ?? 00)-\(day ?? 00)-\(year ?? 0000)"
                            return Constants.dateFormat.date(from: dateString)!
                    }
                    case .mp4:
                        let mp4File = try MP42File(url: self.audiobookUrl)
                        let mp4Date = (mp4File.metadata.metadataItemsFiltered(
                            byIdentifier: MP42MetadataKeyReleaseDate).first?.dateValue)
                        return mp4Date!
                    case .invalid :
                        print("output file is not format handled by Audiobook Tagger")
                }
            } catch { print("error reading date tag") }
        }; return Date()
    }
    
    
    // MARK: Writing Helper Functions
    private var id3Tag: ID3Tag {
        return ID3Tag(
            version: .version3,
            frames: id3FrameDictionary)
    }
    private var id3FrameDictionary: [FrameName : ID3Frame] = [:]
    internal var mp42MetadataItemArray: [MP42MetadataItem] = []
    
    private mutating func set(_ tag: AudiobookTag, to string: String) {
        let stringTags: [AudiobookTag] = [
            .authors,
            .bookTitle,
            .category,
            .copyright,
            .description,
            .keywords,
            .mediaType,
            .narrators,
            .primaryAuthor,
            .publisher,
            .series,
            .summary,
            .title,
            .universe,
            .genre,
        ]
        if stringTags.contains(tag) {
            switch self.format {
                case .mp3 :
                    if tag == .genre {
                        id3FrameDictionary[tag.id3Tag] = ID3FrameGenre(genre: nil, description: string)
                    } else {
                        id3FrameDictionary[tag.id3Tag] = ID3FrameWithStringContent(content: string)
                }
                case .mp4 :
                    if tag == .mediaType {
                        if string == "Podcast" {
                            mp42MetadataItemArray.append(
                                MP42MetadataItem(
                                    identifier: tag.mp4Tag,
                                    value: 21 as NSNumber,
                                    dataType: MP42MetadataItemDataType.integer,
                                    extendedLanguageTag: nil))
                        } else if string == "Periodical" {
                            mp42MetadataItemArray.append(
                                MP42MetadataItem(
                                    identifier: tag.mp4Tag,
                                    value: 11 as NSNumber,
                                    dataType: MP42MetadataItemDataType.integer,
                                    extendedLanguageTag: nil))
                        } else {
                            mp42MetadataItemArray.append(
                                MP42MetadataItem(
                                    identifier: tag.mp4Tag,
                                    value: 02 as NSNumber,
                                    dataType: MP42MetadataItemDataType.integer,
                                    extendedLanguageTag: nil))
                        }
                    } else {
                        mp42MetadataItemArray.append(
                            MP42MetadataItem(
                                identifier: tag.mp4Tag,
                                value: string as NSString,
                                dataType: MP42MetadataItemDataType.string,
                                extendedLanguageTag: nil))
                }
                case .invalid :
                    print("output file is not format handled by Audiobook Tagger")
            }
        }
    }
    
    private mutating func set(_ tag: AudiobookTag, to integer: Int) {
        let intTags: [AudiobookTag] = [
            .seriesIndex,
            .seriesTotal,
            .universeIndex,
            .universeTotal,
        ]
        if intTags.contains(tag) {
            switch self.format {
                case .mp3 :
                    id3FrameDictionary[tag.id3Tag] = ID3FrameWithIntegerContent(value: integer)
                case .mp4 :
                    mp42MetadataItemArray.append(
                        MP42MetadataItem(
                            identifier: tag.mp4Tag,
                            value: integer as NSNumber,
                            dataType: MP42MetadataItemDataType.integer,
                            extendedLanguageTag: nil))
                case .invalid :
                    print("output file is not format handled by Audiobook Tagger")
            }
        } else if tag == .year {
            id3FrameDictionary[tag.id3Tag] = ID3FrameRecordingYear(year: integer)
        }
    }
    
    
    private mutating func set(_ tag: AudiobookTag, to array: [Int]) {
        let intArrayTags: [AudiobookTag] = [
            .disc,
            .track,
        ]
        if intArrayTags.contains(tag) {
            switch self.format {
                case .mp3 :
                    let part = array.first
                    let total = array.last
                    id3FrameDictionary[tag.id3Tag] = ID3FramePartOfTotal(part: part ?? 0, total: total)
                case .mp4 :
                    mp42MetadataItemArray.append(
                        MP42MetadataItem(
                            identifier: tag.mp4Tag,
                            value: (array as [NSNumber]) as NSArray,
                            dataType: MP42MetadataItemDataType.integerArray,
                            extendedLanguageTag: nil))
                case .invalid :
                    print("output file is not format handled by Audiobook Tagger")
            }
        }
    }
    
    private mutating func set(_ tag: AudiobookTag, to date: Date) {
        let calendar = Calendar.current
        if tag == .releaseDate {
            switch self.format {
                case .mp3 :
                    let day = calendar.component(.day, from: date)
                    let month = calendar.component(.month, from: date)
                    id3FrameDictionary[tag.id3Tag] = ID3FrameRecordingDayMonth(day: day, month: month)
                case .mp4 :
                    mp42MetadataItemArray.append(
                        MP42MetadataItem(
                            identifier: MP42MetadataKeyReleaseDate,
                            value: date as NSDate,
                            dataType: MP42MetadataItemDataType.date,
                            extendedLanguageTag: nil))
                case .invalid :
                    print("output file is not format handled by Audiobook Tagger")
            }
        }
    }    
}
