//
//  PlayersViewController.swift
//  TabbedLearnerCards
//
//  Created by Jahnavi Vemuri on 2/26/25.
//

import UIKit

class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var numberOfPlayersTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var players: [(name: String, score: Int)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func createPlayersTapped(_ sender: UIButton) {
        guard let text = numberOfPlayersTextField.text, let numPlayers = Int(text), numPlayers > 0 else {
            return
        }
        
        players = Array(repeating: (name: "", score: 0), count: numPlayers)
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        cell.configure(with: indexPath.row, player: players[indexPath.row], delegate: self)
        return cell
    }
}

extension PlayersViewController: PlayerCellDelegate {
    func updatePlayer(at index: Int, name: String, score: Int) {
        players[index] = (name, score)
    }
}
