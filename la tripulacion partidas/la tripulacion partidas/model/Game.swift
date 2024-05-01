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
    
}

struct Mission {
    let missionNumber: Int
    var completed: Bool = false
}

