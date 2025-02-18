//
//  AddCardsViewController.swift
//  LearnerCardsGame
//
//  Created by Jahnavi Vemuri on 2/18/25.
//

import UIKit

class AddCardsViewController: UIViewController {
    
    var appDelegate : AppDelegate?
    var myLearnerCardModel: LearnerCardModel?

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    @IBAction func addCardOKButton(_ sender: Any) {
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.myLearnerCardModel = self.appDelegate?.myLearnerCardModel
        guard let newQuestion = questionTextField.text, let newAnswer = answerTextField.text else {
            print("Error: Question or Answer fields cannot be empty")
            return
        }
        myLearnerCardModel?.addNewCards(question: newQuestion, answer: newAnswer)
        
        if let tabBarController = self.tabBarController {
                tabBarController.selectedIndex = 0
            } else {
                print("Error: Tab bar controller not found.")
            }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
