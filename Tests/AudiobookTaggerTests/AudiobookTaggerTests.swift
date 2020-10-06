//import XCTest
//@testable import AudiobookTagger
//
//@available(OSX 10.13, *)
//final class AudiobookTaggerTests: XCTestCase {
//    
//    func testReadMetaAndChaptersMP4() throws {
//        let source = try AudiobookFile(from: m4bAudiobook)
//        
//        XCTAssertEqual(source.author, "Anonymous")
//        XCTAssertEqual(source.title, "Tiny Story Book")
//        XCTAssertEqual(source.genreAudible, "Audiobook")
//        XCTAssertNil(source.bookGenre)
//        XCTAssertEqual(source.contentType, .audiobook)
//        XCTAssertEqual(source.partTitle, "Tiny Story Book")
//    }
//    
//    func testReadMetaAndChaptersID3() throws {
//        let source = try AudiobookFile(from: mp3Audiobook)
//        for meta in source.allMetadata {
//            print(meta)
//        }
//        XCTAssertEqual(source.author, "Anonymous")
//        XCTAssertEqual(source.title, "Tiny Story Book")
//        XCTAssertEqual(source.partTitle, "Tiny Story Book")
//    }
//    
//    func testSetMetadataMP4() throws {
//        var source = try AudiobookFile(from: m4bAudiobook)
//        
//        if source.coverArt == nil {
//            try source.setCoverArt(fileLocation: audiobookCover)
//        }
//        source.useComposerForNarrator = true
//
//        source.author = "Author"
//        source.bookGenre = .audiobooksClassics
//        source.category = "Category"
//        source.contentType = .undefined
//        source.copyright = "2020 Copyright"
//        source.description = "Description"
//        source.disc.disc = 1
//        source.disc.totalDiscs = 2
////        source.genre = ""
//        source.keywords = ["Key","Words"]
//        source.narrators = "Narrator"
//        source.partTitle = "Title"
//        source.primaryAuthor = "Author"
//        source.publisher = "Publisher"
//        let calendar = Calendar(identifier: .iso8601)
//        var components = DateComponents()
//        components.year = 1979
//        components.month = 07
//        components.day = 23
//        if let date = calendar.date(from: components) {
//            source.releaseDate = date
//        }
//        source.series.name = "Series"
//        source.series.number = 3
//        source.series.total = 4
//        source.summary = "Summary"
//        source.title = "Title"
//        source.track.track = 5
//        source.track.totalTracks = 6
//        source.universe.name = "Universe"
//        source.universe.number = 7
//        source.universe.total = 8
//        
//        let outputUrl = try localDirectory(fileName: "testMp4-write", fileExtension: "m4b")
//        try source.write(outputLocation: outputUrl)
//        let output = try AudiobookFile(from: outputUrl)
//        
//        XCTAssertNotNil(output.coverArt)
//        XCTAssertEqual(output.author, "Author")
//        XCTAssertEqual(output.bookGenre, .audiobooksClassics)
//        XCTAssertEqual(output.category, "Category")
//        XCTAssertEqual(output.contentType, .undefined)
//        XCTAssertEqual(output.copyright, "2020 Copyright")
//        XCTAssertEqual(output.description, "Description")
//        XCTAssertEqual(output.disc.disc, 1)
//        XCTAssertEqual(output.disc.totalDiscs, 2)
//        XCTAssertEqual(output.genre, "Audiobooks|Classics")
//        XCTAssertEqual(output.keywords, ["Key","Words"])
//        XCTAssertEqual(output.narrators, "Narrator")
//        XCTAssertEqual(output.partTitle, "Title")
//        XCTAssertEqual(output.primaryAuthor, "Author")
//        XCTAssertEqual(output.publisher, "Publisher")
//        if let date = calendar.date(from: components) {
//            XCTAssertEqual(output.releaseDate, date)
//        }
//        XCTAssertEqual(output.series.name, "Series")
//        XCTAssertEqual(output.series.number, 3)
//        XCTAssertEqual(output.series.total, 4)
//        XCTAssertEqual(output.summary, "Summary")
//        XCTAssertEqual(output.title, "Title")
//        XCTAssertEqual(output.track.track, 5)
//        XCTAssertEqual(output.track.totalTracks, 6)
//        XCTAssertEqual(output.universe.name, "Universe")
//        XCTAssertEqual(output.universe.number, 7)
//        XCTAssertEqual(output.universe.total, 8)
//        XCTAssertEqual(output.useComposerForNarrator, true)
//    }
//    
//    func testSetMetadataID3() throws {
//        var source = try AudiobookFile(from: mp3Audiobook)
//        source.useComposerForNarrator = true
//        if source.coverArt == nil {
//            try source.setCoverArt(fileLocation: audiobookCover)
//        }
//
//        source.author = "Author"
//        source.bookGenre = .audiobooksClassics
//        source.category = "Category"
//        source.contentType = .undefined
//        source.copyright = "2020 Copyright"
//        source.description = "Description"
//        source.disc.disc = 1
//        source.disc.totalDiscs = 2
////        source.genre = ""
//        source.keywords = ["Key","Words"]
//        source.narrators = "Narrator"
//        source.partTitle = "Title"
//        source.primaryAuthor = "Author"
//        source.publisher = "Publisher"
//        let calendar = Calendar(identifier: .iso8601)
//        var components = DateComponents()
//        components.year = 1979
//        components.month = 07
//        components.day = 23
//        if let date = calendar.date(from: components) {
//            source.releaseDate = date
//        }
//        source.series.name = "Series"
//        source.series.number = 3
//        source.series.total = 4
//        source.summary = "Summary"
//        source.title = "Title"
//        source.track.track = 5
//        source.track.totalTracks = 6
//        source.universe.name = "Universe"
//        source.universe.number = 7
//        source.universe.total = 8
//        
//        let outputUrl = try localDirectory(fileName: "testMp3-write", fileExtension: "mp3")
//        try source.write(outputLocation: outputUrl)
//        let output = try AudiobookFile(from: outputUrl)
//        
//        XCTAssertNotNil(output.coverArt)
//        XCTAssertEqual(output.author, "Author")
//        XCTAssertEqual(output.bookGenre, .audiobooksClassics)
//        XCTAssertEqual(output.category, "Category")
//        XCTAssertEqual(output.contentType, .undefined)
//        XCTAssertEqual(output.copyright, "2020 Copyright")
//        XCTAssertEqual(output.description, "Description")
//        XCTAssertEqual(output.disc.disc, 1)
//        XCTAssertEqual(output.disc.totalDiscs, 2)
//        XCTAssertEqual(output.genre, "Audiobooks|Classics")
//        XCTAssertEqual(output.keywords, ["Key","Words"])
//        XCTAssertEqual(output.narrators, "Narrator")
//        XCTAssertEqual(output.partTitle, "Title")
//        XCTAssertEqual(output.primaryAuthor, "Author")
//        XCTAssertEqual(output.publisher, "Publisher")
//        if let date = calendar.date(from: components) {
//            XCTAssertEqual(output.releaseDate, date)
//        }
//        XCTAssertEqual(output.series.name, "Series")
//        XCTAssertEqual(output.series.number, 3)
//        XCTAssertEqual(output.series.total, 4)
//        XCTAssertEqual(output.summary, "Summary")
//        XCTAssertEqual(output.title, "Title")
//        XCTAssertEqual(output.track.track, 5)
//        XCTAssertEqual(output.track.totalTracks, 6)
//        XCTAssertEqual(output.universe.name, "Universe")
//        XCTAssertEqual(output.universe.number, 7)
//        XCTAssertEqual(output.universe.total, 8)
//        XCTAssertEqual(output.useComposerForNarrator, true)
//    }
//
//}
//
///*
// */
