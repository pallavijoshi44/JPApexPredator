//
//  PredatorMap.swift
//  JPApexPredator
//
//  Created by Pallavi Joshi on 01/09/2024.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    @State var position : MapCameraPosition
    @State var satellite = false

    var body: some View {
        Map(position: $position) {
            ForEach(Predators().allApexPredators) { predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color:.white, radius: 3)
                        .scaleEffect(x: -1)
                }.annotationTitles(.hidden)
                
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .automatic))
        .overlay(alignment: .bottomTrailing) {
            Button(action: {
                satellite.toggle()
            }, label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.largeTitle)
                    .imageScale(.large)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 7))
                    .shadow(radius: 3)
                    .padding()
                
            })
        }
    }
}

#Preview {
    PredatorMap(position: MapCameraPosition.camera(MapCamera(centerCoordinate: Predators().allApexPredators[2].location, distance: 1000, heading: 250, pitch: 80)))
}
