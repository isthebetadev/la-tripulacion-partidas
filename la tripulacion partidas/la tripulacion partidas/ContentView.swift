//
//  ContentView.swift
//  la tripulacion partidas
//
//  Created by Ruben on 30/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.myBackground.ignoresSafeArea()
                
                VStack {

                    Image("mainScreen")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 250)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    Text("La tripulación, partidas")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Text("El registro de partidas definitivo")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Button(action: {}, label: {
                        Text("Comenzar 🚀")
                            .foregroundStyle(.white)
                            .frame(maxWidth: 125, alignment: .center)
                            .padding(EdgeInsets(
                                top: 11, leading: 18, bottom: 11, trailing: 18
                            ))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.white, lineWidth: 2)
                                    .shadow(color: .white, radius: 3)
                            )
                    })
                    
                }
                
            }
            
        }
        
    }
    
}

#Preview {
    ContentView()
}
