//
//  Game.swift
//  la tripulacion partidas
//
//  Created by Ruben on 1/5/24.
//

import Foundation

struct Game {
    let id: Int
    var name: String
    var players: [String]
    var missions: [Mission]
   
    init(id: Int, name: String, players: [String], missions: [Mission]) {
        self.id = id
        self.name = name
        self.players = players
        self.missions = missions
    }
    
}

struct Mission {
    let missionNumber: Int
    var attempts: Int = 0
    var completed: Bool = false
}

