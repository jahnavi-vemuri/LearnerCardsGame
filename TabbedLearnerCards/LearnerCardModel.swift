//
//  LearnerCardModel.swift
//  TabbedLearnerCards
//
//  Created by Jahnavi Vemuri on 2/3/25.
//

import Foundation
class LearnerCardModel{
    var currentQuestionIndex = 0;
    var questions = ["How much is 7+7 ?",
                     "In what country is Timbuktu ?",
                     "What rotates when you ride a bike ?",
                    "What is the capital of USA ?"]
    var answers = ["14", "Mali", "Wheels", "Washington D.C."]
    init(){
        
    }
    func getNextQuestion() -> String{
        self.currentQuestionIndex = self.currentQuestionIndex + 1
        // TODO DONE: make sure that the app doesn't crash when
        //       reaching past the end of the array's length!
        // HINT: you can use the .count property
        //       of any array object, to check its length
        if self.currentQuestionIndex >= self.questions.count{
            self.currentQuestionIndex = 0
        }
        return self.questions[self.currentQuestionIndex]
    }
    func getAnswer() -> String{
        return self.answers[self.currentQuestionIndex]
    }
    func getCurrentQuestion() -> String{
        return self.questions[self.currentQuestionIndex]
    }
    func setCurrentQuestion(pString: String){
        self.questions[self.currentQuestionIndex] = pString
    }
    func setCurrentAnswer(pString: String){
        self.answers[self.currentQuestionIndex] = pString
    }
    func addNewCards(question: String, answer: String){
        questions.append(question)
        answers.append(answer)
    }
}
