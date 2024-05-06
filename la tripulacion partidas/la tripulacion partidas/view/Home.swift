//
//  Home.swift
//  la tripulacion partidas
//
//  Created by Ruben on 30/4/24.
//

import SwiftUI

struct Home: View {
    
    @State var showHelp: Bool = false
    @State var showNewGameView: Bool = false
    
    var body: some View {
        
        VStack {
            
            NavigationStack {
                
                List { // TODO listado de partidas guardadas
                    Text("partida 1")
                    Text("partida 2")
                    Text("partida 3")
                }
                
            }
            .navigationBarBackButtonHidden()
            .navigationTitle("La Tripulación, partidas")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    
                    // A vista crear partida con formulario
                    Button(action: { toAddGameForm() }, label: {
                        Image(systemName: "plus.circle")
                    })
                    .navigationDestination(
                        isPresented: $showNewGameView,
                        destination: { AddGame() })
                    
                    Button(action: { showHelpPopover() }, label: {
                        Image(systemName: "questionmark.circle")
                    })
                    .popover(isPresented: $showHelp) {
                        ZStack {
                            
                            Color.myBackground.scaleEffect(1.5)
                            
                            VStack {
                                
                                Text("La tripulación, partidas 🚀")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .bold()
                                    .fontDesign(.rounded)
                                    .padding(EdgeInsets(top: 25, leading: 0, bottom: 20, trailing: 0))
                                
                                Label("Ayuda para usar la aplicación", systemImage: "lightbulb.max")
                                    .font(.title3)
                                    .foregroundStyle(.white)
                                    .fontDesign(.rounded)
                                    .padding(.bottom)
                                
                                Text("Desde esta pantalla tenemos varias acciones disponibles... TODO")
                                    .foregroundStyle(.white)
                                    .fontDesign(.rounded)
                                    .padding(.bottom)
                                
                                Button(action: { hideHelpPopover() }) {
                                    Label("Gracias", systemImage: "hands.clap")
                                        .padding(12)
                                        .foregroundColor(.black)
                                        .background(.mint, in: Capsule())
                                       
                                }
                                
                                
                                Spacer()
                                
                            }
        
                        }
                    }
                }
            }
        }
    }
    
    func showHelpPopover() {
        print("show help info")
        showHelp = true
    }
    
    func hideHelpPopover() {
        print("hide help info")
        showHelp = false
    }
    
    func toAddGameForm() {
        print("to add game view form")
        showNewGameView = true
    }
    
}



#Preview {
    Home()
}
