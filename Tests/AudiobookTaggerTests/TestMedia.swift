import Foundation

let testDirectory = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()
    .appendingPathComponent("TestMedia")

public let sampleMp3 = testDirectory
    .appendingPathComponent("mp3-nometa")
    .appendingPathExtension("mp3")

public let sampleMp4 = testDirectory
    .appendingPathComponent("mp4_nometa")
    .appendingPathExtension("m4a")

public let sampleCover = testDirectory
    .appendingPathComponent("samplecover-green")
    .appendingPathExtension("jpg")

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
