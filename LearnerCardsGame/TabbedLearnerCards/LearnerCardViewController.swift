//
//  LearnerCardViewController.swift
//  LearnerCards
//
//  Created by Jahnavi Vemuri on 1/30/25.
//

import UIKit

class LearnerCardViewController: UIViewController {
    
    var appDelegate : AppDelegate?
    var myLearnerCardModel: LearnerCardModel?
    
    @IBOutlet var answerLabel: UILabel!;
    @IBOutlet var questionLabel: UILabel!;
    
    var hasQuestionBeenCalled: Bool = false
    

    @IBAction func showQuestion(_ sender: Any){
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myLearnerCardModel = self.appDelegate?.myLearnerCardModel
        let lQuestion : String = self.myLearnerCardModel!.getNextQuestion()
        self.hasQuestionBeenCalled = true
        self.questionLabel.text = lQuestion
        
        self.answerLabel.text = "(...try guessing...)"
        NotificationCenter.default.post(name: Notification.Name("newQuestionDisplayed"), object: nil)
        
    }
    @IBAction func showAnswer(_ sender: Any){
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myLearnerCardModel = self.appDelegate?.myLearnerCardModel
        if(self.hasQuestionBeenCalled){
            let lAnswer: String = self.myLearnerCardModel!.getAnswer()
            self.answerLabel.text = lAnswer
        }
        else{
            self.answerLabel.text = "show the question first before showing the answer"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
