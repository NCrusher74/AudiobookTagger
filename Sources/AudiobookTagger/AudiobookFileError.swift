
@available(OSX 11.0, iOS 10.0, *)
extension AudiobookFile {

  public enum Error: Swift.Error {
    case unknownFileFormat
    case unableToProcessCoverArt
  }
}
