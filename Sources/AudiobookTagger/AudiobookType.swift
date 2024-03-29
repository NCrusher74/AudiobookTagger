//
//  File.swift
//  
//
//  Created by Nolaine Crusher on 10/20/20.
//

import Foundation
public enum AudiobookType: String, CaseIterable, Codable {
    case narrated = "Narrated"
    case fullCast = "Full Cast"
    case dramatized = "Dramatized"
    case podcast = "Podcast"
    case radioPlay = "Radio Play"
    case graphicAudio = "Graphic Audio"
    case litRPG = "LitRPG"
}
