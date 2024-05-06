//
//  AddGame.swift
//  la tripulacion partidas
//
//  Created by Ruben on 1/5/24.
//

import SwiftUI

struct AddGame: View {
    
    var id: Int
    @State var player: String = ""
    @State var name: String
    @State var players: [String]
    @State var missions: [Mission]
    
    var body: some View {
        VStack {
            Text("Nueva partida")
                .font(.title2)
                .bold()
                .padding()
            
            Form {
                
                Section(header: Text("Datos de partida")) {
                    TextField("Nombre de la partida", text: $name)
                }
                
                Section(header: Text("Jugadores")) {
                    VStack {
                        
                        Label("Nombre del jugador: ", systemImage: "figure.wave" )
                            .foregroundStyle(.black)
                            
                        HStack {
                            TextField("Escribe el nombre", text: $player)
                            Button("", systemImage: "plus.circle", action: {
                                if players.count < 4 {
                                    players.append(player)
                                }
                            })
                        }
                        
                        List {
                            ForEach(players, id: \.self) { playerInList in
                                Label(playerInList)
                            }
                        }
                        
                    }
                }
                
            }
            .navigationTitle("Nueva partida")
            
        }
    }
}


#Preview {
    AddGame(id: 0, name: "game1", players: ["player1", "player2"], missions: [Mission(missionNumber: 1 ),Mission(missionNumber: 2)])
}
