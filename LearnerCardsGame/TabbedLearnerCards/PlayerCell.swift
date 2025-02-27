//
//  PlayerCell.swift
//  TabbedLearnerCards
//
//  Created by Jahnavi Vemuri on 2/26/25.
//

import UIKit

protocol PlayerCellDelegate: AnyObject {
    func updatePlayer(at index: Int, name: String, score: Int)
}

class PlayerCell: UITableViewCell {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var index: Int!
    weak var delegate: PlayerCellDelegate?
    
    func configure(with index: Int, player: (name: String, score: Int), delegate: PlayerCellDelegate) {
        self.index = index
        self.delegate = delegate
        nameTextField?.text = player.name
        scoreLabel.text = "\(player.score)"
    }

    @IBAction func nameChanged(_ sender: UITextField) {
        delegate?.updatePlayer(at: index, name: sender.text ?? "", score: Int(scoreLabel.text ?? "0") ?? 0)
    }

    @IBAction func increaseScore(_ sender: UIButton) {
        let currentScore = Int(scoreLabel.text ?? "0") ?? 0  // Fallback to 0 if invalid
        let newScore = currentScore + 1
        scoreLabel.text = "\(newScore)"
        delegate?.updatePlayer(at: index, name: nameTextField.text ?? "", score: newScore)
    }

    @IBAction func decreaseScore(_ sender: UIButton) {
        let currentScore = Int(scoreLabel.text ?? "0") ?? 0
        let newScore = currentScore - 1
        scoreLabel.text = "\(newScore)"
        delegate?.updatePlayer(at: index, name: nameTextField.text ?? "", score: newScore)
    }
}
