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
    
    // MARK: Public functions
    
    /// returns the author(s) of the audiobook as a string
    /// uses the Artist tag for both MP3 and MP4
    public func authors() throws -> String {
        return string(for: .authors)
    }
    /// returns the title of the audiobook as a string
    /// uses the Album tag for both MP3 and MP4
    public func bookTitle() throws -> String {
        return string(for: .bookTitle)
    }
    /// returns the release date of the audiobook as a date
    /// uses the release date tag for MP4 and recording date tag for MP3
    public func releaseDate() throws -> Date {
        return date(for: .releaseDate)
    }
    /// returns a category tag as a string, which can be implemented as desired
    /// uses the Podcast Category tag for MP3 and Category for MP4
    public func category() throws -> String {
        return string(for: .category)
    }
    /// returns the copyright of the audiobook as a string
    /// uses the Copyright tag for both MP3 and MP4
    public func copyright() throws -> String {
        return string(for: .copyright)
    }
    /// returns a brief description of the audiobook as a string
    /// uses the Comment tag for MP4 and Podcast Description tag for MP3
    public func description() throws -> String {
        return string(for: .description)
    }
    /// returns a genre tag as a string, which can be implemented as desired
    /// uses the freeform version of the Genre tag for both MP3 and MP4
    public func genre() throws -> String {
        return string(for: .genre)
    }
    /// returns a keywords tag as a string, which can be implemented as desired
    /// uses the Podcast Keywords tag for MP3 and Keywords tag for MP4
    public func keywords() throws -> String {
        return string(for: .keywords)
    }
    /// returns a mediaType tag as a string, which can be implemented as desired
    /// uses the Media Type tag for both MP3 and MP4.
    /// Since Media Type (stik) is actually an integer for MP4, valid options are only Audiobook (2), Podcast (21), or Booklet (11) unless your implementation customizes the return further.
    public func mediaType() throws -> String {
        return string(for: .mediaType)
    }
    /// returns the narrator(s) of the audiobook as a string
    /// uses the Composer tag for both MP3 and MP4
    public func narrators() throws -> String {
        return string(for: .narrators)
    }
    /// returns the primary author for a multi-author work as a string (for sorting)
    /// uses the AlbumArtist tag for both MP3 and MP4
    public func primaryAuthor() throws -> String {
        return string(for: .primaryAuthor)
    }
    /// returns the Publisher tag as a string
    public func publisher() throws -> String {
        return string(for: .publisher)
    }
    /// returns a string tag intended for grouping of book series
    /// uses the ContentGrouping tag for MP3 and the Grouping tag for MP4
    public func series() throws -> String {
        return string(for: .series)
    }
    /// returns a string tag for labeling the current volume of a multi file/disc works
    /// uses the Title tag for both MP3 and MP4
    public func title() throws -> String {
        return string(for: .title)
    }
    /// returns a freeform string tag for longer descriptions
    /// uses the UnsyncedLyrics tag for MP3 and the Lyrics tag for MP4
    public func summary() throws -> String {
        return string(for: .summary)
    }
    /// returns a string tag intended for grouping multi-series chronologies by the same author(s)
    /// e.g. The Lord of the Rings would be a series in a Middle Earth universe that also includes The Simarillion
    /// uses the Movement Name tag for both MP3 and MP4
    public func universe() throws -> String {
        return string(for: .universe)
    }
    /// returns an integer tag for the current book in a series
    /// uses the TVEpisodeNumber tag for MP4 and a custom tag for MP3
    /// (the custom tag may not be recognized by all players)
    public func seriesIndex() throws -> Int {
        return integer(for: .seriesIndex)
    }
    /// returns an integer tag for the total books in a series
    /// uses the TVSeason tag for MP4 and a custom tag for MP3
    /// (the custom tag may not be recognized by all players)
    public func seriesTotal() throws -> Int {
        return integer(for: .seriesTotal)
    }
    /// returns an integer tag for the current book in a multi-series chronology
    /// uses the Movement Number tag for MP4 and MP3
    public func universeIndex() throws -> Int {
        return integer(for: .universeIndex)
    }
    /// returns an integer tag for the total books in a multi-series chronology
    /// uses the Movement Count tag for MP4 and MP3
    public func universeTotal() throws -> Int {
        return integer(for: .universeTotal)
    }
    /// returns an integer tag for the year of the audiobook's release
    public func year() throws -> Int {
        return integer(for: .year)
    }
    /// returns an integer array for the current disc/file and number of discs/files
    public func disc() throws -> [Int] {
        return intArray(for: .disc)
    }
    /// returns an integer array for the current track and number of tracks
    public func track() throws -> [Int] {
        return intArray(for: .track)
    }    
    
    // MARK: Private functions
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
            .genre,
            .mediaType
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
                        print("invalid audiobook file format")
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
                        print("invalid audiobook file format")
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
                        print("invalid audiobook file format")
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
                        return (mp4File.metadata.metadataItemsFiltered(
                            byIdentifier: tag.mp4Tag).first?.arrayValue) as! [Int]
                        
                    case .invalid :
                        print("invalid audiobook file format")
                }
            } catch { print("error reading array tag") }
        }; return []
    }

    private func date(for tag: AudiobookTag) -> Date {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
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
                            return formatter.date(from: dateString)!
                    }
                    case .mp4:
                        let mp4File = try MP42File(url: self.audiobookUrl)
                        let mp4Date = (mp4File.metadata.metadataItemsFiltered(
                            byIdentifier: MP42MetadataKeyReleaseDate).first?.dateValue)
                        return mp4Date!
                    case .invalid :
                        print("invalid audiobook file format")
                }
            } catch { print("error reading date tag") }
        }; return Date()
    }
    
    
    
    
}
