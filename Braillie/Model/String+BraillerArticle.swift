//
//  String+BraillerArticle.swift
//  Braillie
//
//  Created by Yu Ho Kwok on 24/3/2023.
//

import Foundation

extension String {
    var braille : BraillArticle {
        return BraillArticle(string: self)
    }
}
