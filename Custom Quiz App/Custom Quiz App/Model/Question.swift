//
//  Question.swift
//  Custom Quiz App
//
//  Created by Brendan Tan on 8/2/23.
//

import Foundation

struct Question {
    
    let text: String
    let answer: String
    let choices: Array<String>
    
    init(q: String, a: String, c: Array<String>) {
        text = q
        answer = a
        choices = c
    }
    
}
