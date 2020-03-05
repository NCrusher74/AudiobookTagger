
import Foundation

@testable import AudiobookTagger

extension Bundle {

    /// A class defined in the test bundle that can be used to find it.
    private class BundleMarker {}

    /// The bundle which houses the tests.
    static let testBundle = Bundle(for: BundleMarker.self)

    /// An audio file for testing.
    static let testAudiobookFile: AudiobookFile = {
      guard let locationOfTestAudioFile = Bundle.testBundle
        .url(forResource: "testfile-blank", withExtension: "m4b") else {
          fatalError("No audio file available for testing.")
      }
        return try! AudiobookFile(from: locationOfTestAudioFile)
    }()

    
    static let testMp3NoMeta: URL = {
        guard let locationOfTestMp3 = Bundle.testBundle.url(forResource: "testfile-blank", withExtension: "mp3") else {
            fatalError("The mp3 file cannot be found")
        }
        return locationOfTestMp3
    }()

    static let testM4bNoMeta: URL = {
        guard let locationOfTestM4b = Bundle.testBundle.url(forResource: "testfile-blank", withExtension: "m4b") else {
            fatalError("The m4b file cannot be found")
        }
        return locationOfTestM4b
    }()

    static let testMp3FullMeta: URL = {
        guard let locationOfTestMp3 = Bundle.testBundle.url(forResource: "testfile-written", withExtension: "mp3") else {
            fatalError("The mp3 file cannot be found")
        }
        return locationOfTestMp3
    }()

    static let testM4bFullMeta: URL = {
        guard let locationOfTestM4b = Bundle.testBundle.url(forResource: "testfile-written", withExtension: "m4b") else {
            fatalError("The m4b file cannot be found")
        }
        return locationOfTestM4b
    }()
    
    static let testMp3ChapteredBlank: URL = {
        guard let locationOfTestMp3 = Bundle.testBundle.url(forResource: "testfile-chaptered", withExtension: "mp3") else {
            fatalError("The mp3 file cannot be found")
        }
        return locationOfTestMp3
    }()

    static let testM4bChapteredBlank: URL = {
        guard let locationOfTestM4b = Bundle.testBundle.url(forResource: "testfile-chaptered", withExtension: "m4b") else {
            fatalError("The m4b file cannot be found")
        }
        return locationOfTestM4b
    }()

}
