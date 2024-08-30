//
//  ContentView.swift
//  JPApexPredator
//
//  Created by Pallavi Joshi on 19/08/2024.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    @State var alphabetical = false
    @State var currentMenuSelection = PredatorType.all
    
    var filteredDinos : [ApexPredator] {
        predators.filter(by: currentMenuSelection)
        predators.sort(by: alphabetical)
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredDinos) { apexPredator in
                NavigationLink {
                    PredatorDetail(predator: apexPredator)
                } label: {
                    HStack {
                        Image(apexPredator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .shadow(color: .white, radius: 1)
                        VStack(alignment:.leading) {
                            Text(apexPredator.name).fontWeight(.bold)
                            Text(apexPredator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(apexPredator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    }
                label: {
                    Image(systemName: alphabetical ? "film" : "textformat")
                        .symbolEffect(.bounce, value: alphabetical)
                }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentMenuSelection.animation()) {
                            ForEach(PredatorType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage:type.icon);
                            }
                            
                        }
                    }
                label:
                    {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
