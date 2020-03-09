//
//  StringExtension.swift
//  AudiobookTagger
//
//  Created by Nolaine Crusher on 3/9/20.
//  Copyright © 2020 Nolaine Crusher. All rights reserved.
//

import Foundation

extension String {
    init?<C : UnicodeCodec>(codeUnits:[C.CodeUnit], codec : C) {
        var codec = codec
        var str = ""
        var generator = codeUnits.makeIterator()
        var done = false
        while !done {
            let r = codec.decode(&generator)
            switch (r) {
            case .emptyInput:
                done = true
            case .scalarValue(let val):
                str.unicodeScalars.append(val)
            case .error:
                return nil
            }
        }
        self = str
    }
}
