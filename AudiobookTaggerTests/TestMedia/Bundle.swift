
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
        .url(forResource: "mp4-no-meta", withExtension: "m4a") else {
          fatalError("No audio file available for testing.")
      }
        return try! AudiobookFile(from: locationOfTestAudioFile)
    }()

    
    static let testMp3NoMeta: URL = {
        guard let locationOfTestMp3 = Bundle.testBundle.url(forResource: "mp3-no-meta", withExtension: "mp3") else {
            fatalError("The mp3 file cannot be found")
        }
        return locationOfTestMp3
    }()

    static let testM4bNoMeta: URL = {
        guard let locationOfTestM4b = Bundle.testBundle.url(forResource: "mp4-no-meta", withExtension: "m4a") else {
            fatalError("The m4a file cannot be found")
        }
        return locationOfTestM4b
    }()

    static let testMp3FullMeta: URL = {
        guard let locationOfTestMp3 = Bundle.testBundle.url(forResource: "mp3-full-meta", withExtension: "mp3") else {
            fatalError("The mp3 file cannot be found")
        }
        return locationOfTestMp3
    }()

    static let testM4bFullMeta: URL = {
        guard let locationOfTestM4b = Bundle.testBundle.url(forResource: "mp4-full-meta", withExtension: "m4a") else {
            fatalError("The m4a file cannot be found")
        }
        return locationOfTestM4b
    }()
}
