
import Foundation

@testable import AudiobookTagger

extension Date {

  init(us string: String) {
    let formatter = DateFormatter.deterministicFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    guard let date = formatter.date(from: string) else {
      fatalError("Not a valid date in the United States’ format.")
    }
    self = date
  }
}
