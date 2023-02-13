//
//  Questions.swift
//  Custom Quiz App
//
//  Created by Brendan Tan on 8/2/23.
//

import Foundation

struct QuestionDB {
    
    let quiz = [
        Question(q:"In which Italian city can you find the Colosseum",a:"Rome",c:["Venice","Rome","Naples"]),
        Question(q:"Which of the following disorders is the fear of being alone?",a:"Agoraphobia",c:["Agoraphobia","Aerophobia","Acrophobia"]),
        Question(q:"What is the speed of sound?",a:"1,200 km/h",c:["120 km/h","1,200 km/h","400 km/h"]),
        
    ]    
    var questionNumber = 0
    var score = 0
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getButtonText() -> Array<String> {
        return quiz[questionNumber].choices
    }
    
    mutating func checkAnswerIfCorrect(_ answerGiven: String) -> Bool {
        if(answerGiven == quiz[questionNumber].answer){
            score += 1
            return true
        }else{
            return false
        }

    }
    
    mutating func nextQuestion(){
        if(questionNumber + 1 < quiz.count){
            questionNumber += 1
        }else{
            questionNumber = 0
            score = 0
        }
    }
    
    mutating func getScore() -> Int{
        return score
    }
    
    func getProgress() -> Float{
        return Float(questionNumber)/Float(quiz.count)
    }
    
}
