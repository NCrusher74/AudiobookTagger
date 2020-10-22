import XCTest
import SwiftTagger
import iTunesGenreID
import SwiftLanguageAndLocaleCodes
@testable import AudiobookTagger

final class AudiobookTaggerTests: XCTestCase {
    
    let author = "Author"
    let narrator = "Narrator"
    let title = "Title"
    let releaseDate: Date? = {
        let dateString = "2017-06-07T00:00:00Z"
        var formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        formatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
        return formatter.date(from: dateString)
    }()
    let audiobookType: AudiobookType = .narrated
    let copyright = "2020 me, myself and I"
    let productionCopyright = "2020 me, myself and I"
    let audiobookDescription = "Description"
    let keywords = ["audiobook", "keywords"]
    let mediaKind: Stik = .audiobook
    let primaryAuthor = "Primary Author"
    let publisher = "Publisher"
    let seriesName = "Series Name"
    let seriesNumber = 2
    let seriesTotal = 3
    let universe = "Universe Name"
    let universeNumber = 5
    let universeTotal = 6
    let volume = "Volume Title"
    let summary = "Summary"
    let track = 7
    let totalTracks = 8
    let disc = 1
    let totalDiscs = 2
    let predefined: Genre = Genre.audiobooks(.romance)
    let custom = "Custom Genre"
    let language: [Language] = [.english]
    
    func testMP3() throws {
        var file = try AudiobookFile(from: sampleMp3)
        file.author = author
        file.audiobookType = audiobookType
        file.textCopyright = copyright
        file.productionCopyright = productionCopyright
        file.description = audiobookDescription
        file.disc.disc = disc
        file.disc.totalDiscs = totalDiscs
        file.genre.predefined = predefined
        file.genre.customGenre = custom
        file.keywords = keywords
        file.mediaKind = mediaKind
        file.narrator = narrator
        file.primaryAuthor = primaryAuthor
        file.publisher = publisher
        file.releaseDateTime = releaseDate
        file.series.name = seriesName
        file.series.number = seriesNumber
        file.series.total = seriesTotal
        try file.setCoverArt(imageLocation: sampleCover)
        file.summary = summary
        file.title = title
        file.track.track = track
        file.track.totalTracks = totalTracks
        file.universe.name = universe
        file.universe.number = universeNumber
        file.universe.total = universeTotal
        file.volumeTitle = volume
        file.languages = language
        
        let outputURL = try tempDirectory().appendingPathComponent("test.mp3")
//        let outputURL = try localDirectory(fileName: "testMP3", fileExtension: "mp3")
        try file.write(outputLocation: outputURL)
        
        let output = try AudiobookFile(from: outputURL)
        XCTAssertEqual(output.author, author)
        XCTAssertEqual(output.audiobookType, audiobookType)
        XCTAssertEqual(output.textCopyright, "© 2020 me, myself and I")
        XCTAssertEqual(output.productionCopyright, "℗ 2020 me, myself and I")
        XCTAssertNotNil(output.coverArt)
        XCTAssertEqual(output.description, audiobookDescription)
        XCTAssertEqual(output.disc.disc, disc)
        XCTAssertEqual(output.disc.totalDiscs, totalDiscs)
        XCTAssertNil(output.genre.predefined)
        XCTAssertEqual(output.genre.customGenre, custom)
        XCTAssertEqual(output.keywords, keywords)
        XCTAssertEqual(output.mediaKind?.stringValue, mediaKind.stringValue)
        XCTAssertEqual(output.narrator, narrator)
        XCTAssertEqual(output.primaryAuthor, primaryAuthor)
        XCTAssertEqual(output.publisher, publisher)
        XCTAssertEqual(output.releaseDateTime, releaseDate)
        XCTAssertEqual(output.summary, summary)
        XCTAssertEqual(output.title, title)
        XCTAssertEqual(output.volumeTitle, volume)
        XCTAssertEqual(output.track.track, track)
        XCTAssertEqual(output.track.totalTracks, totalTracks)
        XCTAssertEqual(output.universe.name, universe)
        XCTAssertEqual(output.universe.number, universeNumber)
        XCTAssertEqual(output.universe.total, universeTotal)
        XCTAssertEqual(output.series.name, seriesName)
        XCTAssertEqual(output.series.number, seriesNumber)
        XCTAssertEqual(output.series.total, seriesTotal)
        XCTAssertEqual(output.languages, language)
    }
    
    func testMP4() throws {
        var file = try AudiobookFile(from: sampleMp4)
        file.author = author
        file.audiobookType = audiobookType
        file.textCopyright = copyright
        file.productionCopyright = productionCopyright
        file.description = audiobookDescription
        file.disc.disc = disc
        file.disc.totalDiscs = totalDiscs
        file.genre.predefined = predefined
        file.genre.customGenre = custom
        file.keywords = keywords
        file.mediaKind = mediaKind
        file.narrator = narrator
        file.primaryAuthor = primaryAuthor
        file.publisher = publisher
        file.releaseDateTime = releaseDate
        file.series.name = seriesName
        file.series.number = seriesNumber
        file.series.total = seriesTotal
        try file.setCoverArt(imageLocation: sampleCover)
        file.summary = summary
        file.title = title
        file.track.track = track
        file.track.totalTracks = totalTracks
        file.universe.name = universe
        file.universe.number = universeNumber
        file.universe.total = universeTotal
        file.volumeTitle = volume
        file.languages = language
        
        let outputURL = try tempDirectory().appendingPathComponent("test.m4a")
//        let outputURL = try localDirectory(fileName: "testMP4", fileExtension: "m4a")
        try file.write(outputLocation: outputURL)
        
        let output = try AudiobookFile(from: outputURL)
        XCTAssertEqual(output.author, author)
        XCTAssertEqual(output.audiobookType, audiobookType)
        XCTAssertEqual(output.textCopyright, "© 2020 me, myself and I")
        XCTAssertEqual(output.productionCopyright, "℗ 2020 me, myself and I")
        XCTAssertNotNil(output.coverArt)
        XCTAssertEqual(output.description, audiobookDescription)
        XCTAssertEqual(output.disc.disc, disc)
        XCTAssertEqual(output.disc.totalDiscs, totalDiscs)
        XCTAssertEqual(output.genre.predefined?.stringValue, predefined.stringValue)
        XCTAssertEqual(output.genre.customGenre, custom)
        XCTAssertEqual(output.keywords, keywords)
        XCTAssertEqual(output.mediaKind?.stringValue, mediaKind.stringValue)
        XCTAssertEqual(output.narrator, narrator)
        XCTAssertEqual(output.primaryAuthor, primaryAuthor)
        XCTAssertEqual(output.publisher, publisher)
        XCTAssertEqual(output.releaseDateTime, releaseDate)
        XCTAssertEqual(output.summary, summary)
        XCTAssertEqual(output.title, title)
        XCTAssertEqual(output.volumeTitle, volume)
        XCTAssertEqual(output.track.track, track)
        XCTAssertEqual(output.track.totalTracks, totalTracks)
        XCTAssertEqual(output.universe.name, universe)
        XCTAssertEqual(output.universe.number, universeNumber)
        XCTAssertEqual(output.universe.total, universeTotal)
        XCTAssertEqual(output.series.name, seriesName)
        XCTAssertEqual(output.series.number, seriesNumber)
        XCTAssertEqual(output.series.total, seriesTotal)
        XCTAssertEqual(output.languages, language)
    }
}
