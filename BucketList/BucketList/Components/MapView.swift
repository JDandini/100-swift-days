//
//  MapView.swift
//  BucketList
//
//  Created by Javier Castañeda on 12/08/26.
//

import MapKit
import SwiftUI

struct MapView: View {
    @Binding var viewModel: ContentView.ViewModel
    @State private var styleSelected: MapTypeOption = .standard
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    var body: some View {
        NavigationStack {
            MapReader { proxy in
                Map(initialPosition: startPosition) {
                    ForEach(viewModel.locations) { location in
                        Annotation(location.name, coordinate: location.coordinate) {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.teal)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                                .onTapGesture {
                                    viewModel.selectedPlace = location
                                }
                        }
                    }
                }
                .gesture(
                    LongPressGesture(minimumDuration: 0.5)
                        .sequenced(before: DragGesture(minimumDistance: 0))
                        .onEnded { value in
                            switch value {
                            case .second(true, let drag):
                                if let location = drag?.location,
                                   let coordinate = proxy.convert(location, from: .local) {
                                    viewModel.addLocation(at: coordinate)
                                }
                            default:
                                break
                            }
                        }
                )
                .sheet(item: $viewModel.selectedPlace) { place in
                    EditPlaceView(location: place) {
                        viewModel.update(location: $0)
                    }
                }
                .mapStyle(styleSelected.mapStyle)
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Picker("Map style", selection: $styleSelected) {
                            ForEach(MapTypeOption.allCases) { option in
                                Label(option.rawValue, systemImage: option.icon)
                                    .tag(option)
                            }
                        }
                    } label: {
                        Image(systemName: "map")
                    }
                }
            }
        }
    }
}

extension MapView {
    enum MapTypeOption: String, CaseIterable, Identifiable {
        case standard
        case hybrid
        case satellite

        var id: String { rawValue }

        var mapStyle: MapStyle {
            switch self {
            case .standard: return .standard
            case .hybrid: return .hybrid
            case .satellite: return .imagery
            }
        }

        var icon: String {
            switch self {
            case .standard: return "map"
            case .hybrid: return "globe.americas"
            case .satellite: return "camera.viewfinder"
            }
        }
    }
}
#Preview {
    @Previewable @State var viewModel = ContentView.ViewModel()
    MapView(viewModel: $viewModel)
}
