# AudiobookTagger
2020 Nolaine Crusher

AudiobookTagger is a package dependency for tagging non-DRMed .m4b, ,m4a, and .mp3 audiobooks with metadata, sometimes repurposing normally-unused metadata tags in order to facilitate library management. However, since the tags can be used for any other form of audio, there's no reason it can't be put to music-tagging purposes as well.

**METADATA OPTIONS**:

AudiobookTagger is designed to work with Audiobook Librarian, my upcoming audiobook library management project. Therefore, it may handle metadata a little differently. Here are a few custom differences, which you may ignore at your convenience:

**SERIES/UNIVERSE OPTIONS**:
Comprehensive series/univers management is a feature that is sorely lacking in virtually all library management apps, especially for audiobooks. Audiobook Librarian's primary aim will be to fix that, and AudiobookTagger gives me the option to start putting the metadata in place for that.

_Primary Author_: (writes to Album Artist tag)
This field will serve for the primary author(s) of a series or universe that may involve multiple authors, for sorting purposes. For instance, the Dragonriders of Pern series may have Anne McCaffrey as the Primary Author, even though Todd McCaffrey and Gigi McCaffrey have also written books in the series. The Honor Harrington universe may have David Weber as the Primary Author, even though a dozen or more other authors have contributed to the side novels and anthologies.

That way, when sorting in Audiobook Librarian, the entire series will be kept together under a single author, regardless of who wrote the individual books, and the series will be sorted with the Primary Author's other books, instead of by "Author A & Author B," separate from any other books written by either Author A OR Author B.

_Series and series index_: (writes to Grouping/TVEpisodeNumber/TVSeasonNumber tags for .m4a/.m4a and to a custom TXXX tags for .mp3)
Just what it says on the tin. Be aware, though, that series can be different from universe. For example:
"The Lord of the Rings" may be a series, but it's part of a greater "Middle Earth" universe that includes The Hobbit, The Simarillion, The Fall of Gondolin, The Children of Húrin, Beren and Luthien, and so forth. Mercedes Lackey's Heralds of Valdemar trilogy is only one series in the multi-series Valdemar universe.

_Universe and universe index_: (writes to Movement/MovementNumber/MovementCount tags)
This will be used in Audiobook Librarian primarily as a sorting and playlist-building tool, enabling you to build a chronological playlist of titles that span multiple series, which may have been published out of order when sorting by internal universe chronology. You will then be able to import to a companion app I plan to release forAudiobook Librarian, specifically for device-side playback.
