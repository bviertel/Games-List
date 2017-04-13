//
//  GamesViewController.swift
//  Games List
//
//  Created by Brandon Viertel on 4/13/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Variable for the Main Table View
    
    @IBOutlet weak var tableView: UITableView!
    
    var games : [Game] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        games = createGames()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // Returns the number of rows in table based on number of entries in array.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return games.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let game = games[indexPath.row]
        
        // Changes String of each 'cell' on Main Table View to game.name
        
        cell.textLabel!.text = game.name
        
        return cell
        
    
    }
    
    // When the '+' button is tapped. Make sure sender is 'nil'
    
    @IBAction func addTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! AddViewController
        
        nextVC.previousVC = self
        
    }
    
    
    
    // Creates an initial list of games
    
    func createGames() -> [Game] {
        
        let game1 = Game()
        
        game1.name = "World of Warcraft"
        
        game1.type = "MMORPG"
        
        game1.rating = 7
        
        game1.nTB = false
        
        let game2 = Game()
        
        game2.name = "Legend of Zelda"
        
        game2.type = "Adventure"
        
        game2.rating = 10
        
        game2.nTB = true
        
        let gA : [Game] = [game1,game2]
        
        return gA
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

