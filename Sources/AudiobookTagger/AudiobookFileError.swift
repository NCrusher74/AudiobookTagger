
@available(OSX 10.12, iOS 12.0, *)
extension AudiobookFile {

  public enum Error: Swift.Error {
    case unknownFileFormat
    case unableToProcessCoverArt
  }
}
