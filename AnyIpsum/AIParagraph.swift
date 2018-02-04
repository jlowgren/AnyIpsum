//
//  AIParagraph.swift
//  AnyIpsum
//
//  Created by Joacim Löwgren on 2018-02-04.
//  Copyright © 2018 Joacim Löwgren. All rights reserved.
//

import Foundation

struct AIParagraph {
    var paragraph: String = ""
    
    init(_ words: String) {
        let MaxSentences: UInt32 = 7
        let MinSentences: UInt32 = 5
        let sentenceCount = Int(arc4random_uniform(MaxSentences) + MinSentences)
        
        for _ in 0...sentenceCount {
            paragraph += self.createSentence(words)
        }
        
        paragraph = paragraph
            .trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func createSentence(_ words: String) -> String {
        let MaxWords: UInt32 = 8
        let MinWords: UInt32 = 4
        let words = words.words
        let wordCount = Int(arc4random_uniform(MaxWords) + MinWords)
        
        var sentence = ""
        
        for _ in 0...wordCount {
            let randomWordIndex = Int(arc4random_uniform(UInt32(words.count)))
            sentence += "\(words[randomWordIndex]) "
        }
        
        return sentence
            .condenseWhitespace().lowercased()
            .capitalizeFirstLetter() + ". "
    }
}
