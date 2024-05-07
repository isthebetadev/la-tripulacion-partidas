//
//  Game.swift
//  la tripulacion partidas
//
//  Created by Ruben on 1/5/24.
//

import Foundation

struct Game: Encodable, Decodable {
    let id: Int
    var name: String
    var players: [String]
    var missions: [Mission]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case players
        case missions
     }
   
    init(id: Int, name: String, players: [String], missions: [Mission]) {
        self.id = id
        self.name = name
        self.players = players
        self.missions = missions
    }
    
    init(from decoder: any Decoder) throws {
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

