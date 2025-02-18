//
//  EditCardsViewController.swift
//  TabbedLearnerCards
//
//  Created by Jahnavi Vemuri on 2/16/25.
//

import UIKit

class EditCardsViewController: UIViewController {
    var appDelegate : AppDelegate?
    var myLearnerCardModel: LearnerCardModel?
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    var currentQuestion: String?
    var currentAnswer: String?
    
    @IBAction func buttonOKAction(sender: AnyObject){
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myLearnerCardModel = self.appDelegate?.myLearnerCardModel
        
        guard let newQuestionString = questionTextField.text, !newQuestionString.isEmpty,
              let newAnswerString = answerTextField.text, !newAnswerString.isEmpty else {
            print("Error: Question or Answer field is empty")
            return
        }
        
        myLearnerCardModel?.setCurrentQuestion(pString: newQuestionString)
        myLearnerCardModel!.setCurrentAnswer(pString: newAnswerString)
        
        // Find the root tab bar controller
            if let tabBarController = self.view.window?.rootViewController as? UITabBarController {
                print("Tab bar controller found. Switching to LearnerCards tab...")
                
                // Switch to the correct tab index (Adjust if needed)
                tabBarController.selectedIndex = 0  // Change to match LearnerCards tab

                // Dismiss the current EditCardsViewController
                self.dismiss(animated: true, completion: nil)
            } else {
                print("Error: Tab bar controller still not found.")
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        self.myLearnerCardModel = self.appDelegate?.myLearnerCardModel
        
        if let currentQuestionString = myLearnerCardModel?.getCurrentQuestion() {
            questionTextField.text = currentQuestionString
        }
        if let currentAnswerString = myLearnerCardModel?.getAnswer(){
            answerTextField.text = currentAnswerString
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
