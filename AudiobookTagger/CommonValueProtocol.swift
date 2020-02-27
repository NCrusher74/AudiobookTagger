//
//  CommonProtocol.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 2/26/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation
import ID3TagEditor
import MP42Foundation

protocol commonValue {
    var id3Value: ID3Frame { get set }
    var mp4Value: MP42MetadataItem { get set }
}
