
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
        .path(forResource: "testfile-nometa", ofType: "m4b") else {
          fatalError("No audio file available for testing.")
      }
        return AudiobookFile(from: locationOfTestAudioFile)
    }()
    
    static let testMp3NoMeta: String = {
        guard let locationOfTestMp3 = Bundle.testBundle.path(forResource: "testfile-nometa", ofType: "mp3") else {
            fatalError("The mp3 file cannot be found")
        }
        return locationOfTestMp3
    }()

    static let testM4bNoMeta: String = {
        guard let locationOfTestM4b = Bundle.testBundle.path(forResource: "testfile-nometa", ofType: "m4b") else {
            fatalError("The m4b file cannot be found")
        }
        return locationOfTestM4b
    }()

    static let testMp3FullMeta: String = {
        guard let locationOfTestMp3 = Bundle.testBundle.path(forResource: "testfile-id3TE-fullmetaV3", ofType: "mp3") else {
            fatalError("The mp3 file cannot be found")
        }
        return locationOfTestMp3
    }()

    static let testM4bFullMeta: String = {
        guard let locationOfTestM4b = Bundle.testBundle.path(forResource: "testfile-mp42-fullmeta", ofType: "m4b") else {
            fatalError("The m4b file cannot be found")
        }
        return locationOfTestM4b
    }()

}
