# AudiobookTagger
2020 Nolaine Crusher

AudiobookTagger is a library for tagging non-DRMed .m4b, ,m4a, and .mp3 audiobooks with metadata, sometimes repurposing normally-unused metadata tags in order to facilitate library management. For more general audio file tagging, please check out SwiftTagger.

**METADATA OPTIONS**:

Since most recognized metadata tags were intended for music media, AudiobookTagger may handle metadata a little differently. Here are a few custom differences, which you may ignore at your convenience:

_Primary Author_: (writes to Album Artist tag)
This field will serve for the primary author(s) of a series or universe that may involve multiple authors, for sorting purposes. For instance, the _Dragonriders of Pern_ series may have Anne McCaffrey as the Primary Author, even though Todd McCaffrey and Gigi McCaffrey have also written books in the series. The Honor Harrington universe may have David Weber as the Primary Author, even though a dozen or more other authors have contributed to the side novels and anthologies.

_Series and series index_: (writes to Grouping/TVEpisodeNumber/TVSeasonNumber tags for .m4a/.m4a and to grouping and custom TXXX tags for .mp3)
Just what it says on the tin. Be aware, though, that series can be different from universe. For example:
_The Lord of the Rings_ may be a series, but it's part of a greater "Middle Earth" universe that includes _The Hobbit_, The Simarillion/(The Fall of Gondolin/The Children of Húrin/Beren and Luthien), and so forth. Mercedes Lackey's _Heralds of Valdemar_ trilogy is only one series in the multi-series Valdemar universe.

_Universe and universe index_: (writes to Movement/MovementNumber/MovementCount tags)
For building a chronological playlist of titles that span multiple series, which may have been published out of order when sorting by internal universe chronology.

_AudiobookType_: (writes to PodcastCategory tag)
This describes the style of the audiobook, for example, whether it is narrated or enacted by a full cast, whether it's graphic audio, LitRPG, etc.

_VolumeTitle_:
This is for use when each part of a set of files has a different title. A good example of this would be Marion Zimmer Bradley's _The Mists of Avalon_ is divided into four volumes, "Mistress of Magic", "The High Queen", "The King Stag", and "The Prisoner in the Oak".

**In short:**
Title = The book title
VolumeTitle = The title of a part of a book divided into sections
ChapterTitle = The title of a chapter

_Release Date_
To ensure recognition and compatibility, release date should be in ISO-8601 format, i.e. "yyyy-MM-ddTHH:mm:ssZ"

## Usage
*To set tags:*
```swift
// (some of this data is made up just to provide an example)
let url = URL(fileWithPath: "path/to/yourFile.m4b") // or "path/to/yourFile.mp3"
var file = try AudiobookFile(from: url)

file.useComposerForNarrator: false // if true, will write narrator metadata to Composer tags
file.title = "Crown of Slaves"
file.author = "David Weber, Eric Flint"
file.audiobookType = .narrated
file.textCopyright = "2005 David Weber"
file.productionCopyright = "2009 Audible Inc"
file.narrator = "Peter Larkin"
file.primaryAuthor = "David Weber"
file.publisher = "Baen Books"

file.disc.disc = 2
file.disc.totalDiscs = 5
file.volumeTitle = "PART II: EREWHON"

file.track.track = 17
file.track.totalTracks = 49

file.genre.predefined = .audiobooks(.sciFiAndFantasy)
file.genre.customGenre = "Space Opera"
file.keywords = ["Space station", "Slavery"]
file.mediaKind  = .audiobook

let releaseDate: Date? = {
let dateString = "2009-12-22T00:00:00Z"
var formatter = ISO8601DateFormatter()
formatter.formatOptions = .withInternetDateTime
formatter.timeZone = TimeZone(secondsFromGMT: 0) ?? .current
return formatter.date(from: dateString)
}()
file.releaseDateTime = releaseDate

file.languages = [.english]

// (allows newline characters)
file.description = "The Star Kingdom's best spy and the Republic of Haven's most capable agent team up to stop the abduction of the Queen of Manticore's neice." 

file.summary = 
"""
The Star Kingdom's ally Erewhon is growing increasingly restive in the alliance because the new High Ridge regime ignores its needs. Added to the longstanding problem of a slave labor planet controlled by hostile Mesans in Erewhon's stellar backyard, which High Ridge refuses to deal with, the recent assassination of the Solarian League's most prominent voice of public conscience indicates the growing danger of political instability in the Solarian League—which is also close to Erewhon.

In desperation, Queen Elizabeth tries to defuse the situation by sending a private mission to Erewhon led by Captain Zilwicki, accompanied by one of her nieces. When they arrive on Erewhon, however, Manticore's envoys find themselves in a mess. Not only do they encounter one of the Republic of Haven's most capable agents—Victor Cachat—but they also discover that the Solarian League's military delegation seems up to its neck in skullduggery.

And, just to put the icing on the cake, the radical freed slave organization, the Audubon Ballroom, is also on the scene—led by its notorious and ruthless assassin, Jeremy X.
"""

file.series.name = "Wages of Sin"
file.series.number = 1
file.series.total = 3

file.universe.name = "Honorverse"
file.universe.number = 14
file.universe.total = 27

try file.setCoverArt(imageLocation: imageLocation.url)
```
*To retrieve tags:*
```swift
let url = URL(fileWithPath: "path/to/yourFile.m4b") // or "path/to/yourFile.mp3"
var file = try AudiobookFile(from: url)

print(file.author) // "David Weber, Eric Flint"
print(file.title) // "Crown of Slaves"
// etc
```

### Chapter handling:
_Chapter start times are in milliseconds_

```swift
// list all chapters
for chapter in file.chapterList {
print(chapter)
}
// (startTime: 0, title: "Chapter 01")
// (startTime: 30000, title: "Chapter 02")
// (startTime: 60000, title: "Chapter 03")
// (startTime: 90000, title: "Chapter 04")
// (startTime: 120000: title: "Chapter 05")

// find a chapter by title
print(file.chapterList.first(where: {$0.title == "Chapter 04"})
// (startTime: 90000: title: "Chapter 04")

file.addChapter(startTime: 150000, title: "Chapter 06")

// to rename a chapter, simply add a chapter at the same start time as an existing chapter, with a new title
file.addChapter(startTime: 60000, title: "Chapter Three")

// When removing chapters, remove them in reverse order to be sure the start time doesn't shift.
file.removeChapter(startTime: 120000)
file.removeChapter(startTime: 90000)
file.removeChapter(startTime: 60000)

file.removeAllChapters()
```

Available tags:
* `title`
* `author`
* `narrator`
* `primaryAuthor`
* `publisher`
* `textCopyright`
* `productionCopyright`
* `description`
* `summary`
* `releaseDateTime`
* `languages`  // string array
* `volumeTitle`

* `disc.disc`
* `disc.totalDiscs`
* `track.track`
* `track.totalTracks`

* `genre.predefined` // selected from list
* `genre.customGenre` // freeform string

* `keywords` // string array
* `mediaKind` // iTunes `stik` atom
* `audiobookType`

* `coverArt` // returns art as `NSImage`
* `setCoverArt(imageLocation: URL)` // adds cover art from location of image file
* `removeCoverArt()`

* `series.name`
* `series.number`
* `series.total`

* `universe.name`
* `universe.number`
* `universe.total`
