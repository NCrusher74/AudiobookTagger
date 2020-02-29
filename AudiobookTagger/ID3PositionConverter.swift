//
//  ID3PositionConverter.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/29/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import ID3TagEditor

/** a type that converts the ID3TagEditor position return (a string that reads "`Int` of `Int`") to an array */
struct ID3PositionConverter {

    // convert "# of #" String to [Int]
    func convertTrackPositionFrame() -> [Int] {
        let position: Int
        let totalTracks: Int?
        let trackPosition = ID3FrameTrackPosition(position: position, totalTracks: totalTracks)
        let trackArray = trackPosition.debugDescription.components(separatedBy: " of ")
        guard let firstInt = Int(trackArray.first ?? "") else { return [0] }
        guard let lastInt = Int(trackArray.last ?? "") else { return [0] }
        return [firstInt, lastInt]
    }
    
    func convertDiscPositionFrame() -> [Int] {
        let position: Int
        let totalDiscs: Int?
        let discPosition = ID3FrameDiscPosition(position: position, totalDiscs: totalDiscs)
        let discArray = discPosition.debugDescription.components(separatedBy: " of ")
        guard let firstInt = Int(discArray.first ?? "") else { return [0] }
        guard let lastInt = Int(discArray.last ?? "") else { return [0] }
        return [firstInt, lastInt]
    }

    func convertMovementIndexFrame() -> [Int] {
        let index: Int
        let totalMovements: Int?
        let discPosition = ID3FrameMovementIndex(index: index, totalMovements: totalMovements)
        let discArray = discPosition.debugDescription.components(separatedBy: " of ")
        guard let firstInt = Int(discArray.first ?? "") else { return [0] }
        guard let lastInt = Int(discArray.last ?? "") else { return [0] }
        return [firstInt, lastInt]
    }

    func convertSeriesIndexFrame(index: Int, totalBooks: Int?) -> [Int] {
        let index: Int
        let totalBooks: Int?
        let seriesPosition = ID3FrameSeriesIndex(index: index, totalBooks: totalBooks)
        let seriesArray = seriesPosition.debugDescription.components(separatedBy: " of ")
        guard let firstInt = Int(seriesArray.first ?? "") else { return [0] }
        guard let lastInt = Int(seriesArray.last ?? "") else { return [0] }
        return [firstInt, lastInt]
    }

    
    
}
