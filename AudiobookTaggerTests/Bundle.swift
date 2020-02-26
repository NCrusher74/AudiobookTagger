
import Foundation

@testable import AudiobookTagger

extension Bundle {

    /// A class defined in the test bundle that can be used to find it.
    private class BundleMarker {}

    /// The bundle which houses the tests.
    static let testBundle = Bundle(for: BundleMarker.self)

    /// An audio file for testing.
    static let testAudioFile: AudioFile = {
      guard let locationOfTestAudioFile = Bundle.testBundle
        .url(forResource: "article", withExtension: "aax") else {
          fatalError("No audio file available for testing.")
      }
      return AudioFile(location: locationOfTestAudioFile)
    }()
    
    static let testAAX: URL = {
        guard let locationOfTestAAX = Bundle.testBundle.url(forResource: "article", withExtension: "aax") else {
            fatalError("The aax file cannot be found")
        }
        return locationOfTestAAX
    }()
    
    static let testM4B: URL = {
        guard let locationOfTestM4B = Bundle.testBundle.url(forResource: "article", withExtension: "m4b") else {
            fatalError("The m4b file cannot be found")
        }
        return locationOfTestM4B
    }()

    static let testCover: URL = {
        guard let locationOfTestCover = Bundle.testBundle.url(forResource: "samplecover", withExtension: "jpg") else {
            fatalError("The jpg file cannot be found")
        }
        return locationOfTestCover
    }()

}
