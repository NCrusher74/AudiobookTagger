import Foundation

let testDirectory = URL(fileURLWithPath: #file)

//let mp3Audiobook = testDirectory
//    .deletingLastPathComponent()
//    .appendingPathComponent("TinyStoryBook_librivox")
//    .appendingPathExtension("mp3")
//
//let m4bAudiobook = testDirectory
//    .deletingLastPathComponent()
//    .appendingPathComponent("TinyStoryBook_librivox")
//    .appendingPathExtension("m4b")
//
//let audiobookCover = testDirectory
//    .deletingLastPathComponent()
//    .appendingPathComponent("Tiny_Story_Book_Cover")
//    .appendingPathExtension("jpg")

@available(OSX 10.12, *)
func localDirectory(fileName: String, fileExtension: String) throws -> URL {
    let home = FileManager.default.homeDirectoryForCurrentUser
    let desktopPath = "Desktop/TestOutput"
    let directory = home.appendingPathComponent(
        desktopPath, isDirectory: true)
    return directory.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
}

@available(OSX 10.12, *)
func tempDirectory() throws -> URL {
    let tempDirectory = FileManager.default.temporaryDirectory
        .appendingPathComponent("AudioBookTaggerTemp",
                                isDirectory: true)
    try FileManager.default.createDirectory(
        at: tempDirectory,
        withIntermediateDirectories: true)
    return tempDirectory
}

@available(OSX 10.12, *)
func emptyDirectory() throws {
    try FileManager.default.removeItem(at: tempDirectory())
}
