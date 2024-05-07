//
//  AddGame.swift
//  la tripulacion partidas
//
//  Created by Ruben on 1/5/24.
//

import SwiftUI

struct AddGame: View {
    
    @State var toHomePage: Bool = false
    @State var id: Int
    @State var player: String
    @State var name: String
    @State var players: [String]
    @State var missions: [Mission]
    
    init() {
        self.id = 0
        self.name = ""
        self.player = ""
        self.players = []
        self.missions = []
    }
    
    var body: some View {
        VStack {
            Form {
                
                Section(header: Text("Datos de partida").bold()) {
                    TextField("Nombre de la partida", text: $name)
                }
                
                Section(header: Text("Jugadores").bold()) {
                    VStack {
                        HStack {
                            Label("Nombre:", systemImage: "figure.wave" )
                                .foregroundStyle(.myBackground)
                            TextField("Escribe el nombre", text: $player)
                            Button("", systemImage: "plus.circle", action: {
                                if player != "" && players.count < 4 {
                                    players.append(player)
                                    player = ""
                                }
                            })
                            .foregroundStyle(.myBackground)
                        }
                    }
                }
                
                List {
                    ForEach(players, id: \.self) { playerInList in
                        Text(playerInList)
                            .swipeActions(allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    print("Deleting player in list: \(playerInList)")
                                    players.removeAll { $0 == playerInList }
                                    print("Players now: \(players)")
                                } label: {
                                    Label("Borrar", systemImage: "trash.fill")
                                }
                            }
                    }
                    
                }
                
                Section {
                    Button(action: { saveGameData() }) {
                        Label("Guardar partida", systemImage: "externaldrive.fill.badge.plus")
                            .foregroundStyle(.myBackground)
                    }
                    .navigationDestination(isPresented: $toHomePage, destination: { Home() })
                }
                
            }
            .navigationTitle("Nueva partida")
            
        }
        
    }
    
    func saveGameData() {
        let dataManager = GameDataManager()
        // TODO call to viewmodel manager for get the last id and initialize this id with last+1
        id = dataManager.generateNextId()
        // TODO create the Game model with the 50 missions
        fillMissionList()
        var gameToSave: Game = Game(id: id, name: name, players: players, missions: missions)
        // TODO call to viewmodel manager for save the game
        print("Saving game..")
        var result = dataManager.saveGame(gameToSave)
        if result {
            print("Back to home page")
            toHomePage = true
        }
        
    }
    
    func fillMissionList() {
        print("Generating missions...")
        missions = []
        for i in 1...50 {
            var mision = Mission(missionNumber: i)
            missions.append(mision)
        }
    }
}


#Preview {
    AddGame()
}
