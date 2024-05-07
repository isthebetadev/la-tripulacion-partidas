//
//  GameDataManager.swift
//  la tripulacion partidas
//
//  Created by Ruben on 7/5/24.
//

import Foundation

class GameDataManager {
    
    var gameData: Game = Game(id: 0, name: "", players: [], missions: [])
    
    func saveGame(_ game: Game) -> Bool {
        if let savedData = UserDefaults.standard.object(forKey: "gamesSaved") as? Data {
            do{
                var gamesSaved = try JSONDecoder().decode([Game].self, from: savedData)
                if gamesSaved != nil {
                    gamesSaved.append(game)
                    UserDefaults.standard.set(gamesSaved, forKey: "gamesSaved")
                    print("Data existing - Save data is correct")
                } else {
                    do {
                        var newGamesSaved: [Game] = [game]
                        let encodedData = try JSONEncoder().encode(newGamesSaved)
                        UserDefaults.standard.set(newGamesSaved, forKey: "gamesSaved")
                        print("First Data created - Save data is correct")
                    } catch    {
                        print("error savind data")
                    }
                    
                }
            } catch {
                print("failed to convert Data in Game")
            }
        }
        
        
        return true
    }
    
    func generateNextId() -> Int {
        var id: Int = 0
        var gamesSaved = UserDefaults.standard.array(forKey: "gamesSaved")
        print(gamesSaved)
        if gamesSaved != nil {
            print("Next ID generated")
        } else {
            id = 0
            print("first ID generated")
        }
        return id
    }
    
}
