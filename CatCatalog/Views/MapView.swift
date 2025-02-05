//
//  MapView.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 05-02-25.
//
import SwiftUI
import MapKit

struct MapView: View {
    @State private var cameraPosition: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $cameraPosition)
            .onAppear {
                setCameraPosition()
            }
    }
    
    private func setCameraPosition() {
        let pyramidLocation = CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342) // Great Pyramid of Giza

        let distance: CLLocationDistance = 800 // Adjust altitude for zoom level
        let pitch: CGFloat = 70 // Tilt the camera for 3D effect
        let heading: CLLocationDirection = 180 // Rotate map for better alignment

        let camera = MapCamera(
            centerCoordinate: pyramidLocation,
            distance: distance,
            heading: heading,
            pitch: pitch
        )

        cameraPosition = .camera(camera) // Correct type assignment
    }
}

#Preview {
    MapView()
}

