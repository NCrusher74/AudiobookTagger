
@available(OSX 10.13, *)
extension AudiobookFile {

  public enum Error: Swift.Error {
    case unknownFileFormat
    case unableToProcessCoverArt
  }
}
