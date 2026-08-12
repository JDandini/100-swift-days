//
//  EditPlaceView.swift
//  BucketList
//
//  Created by Javier Castañeda on 11/08/26.
//

import SwiftUI

struct EditPlaceView: View {
    enum LoadingState {
        case loading
        case loaded
        case failed
    }

    @Environment(\.dismiss) var dismiss
    var location: Location
    var onSave: (Location) -> Void

    @State private var name: String
    @State private var description: String
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $name)
                    TextField("Description", text: $description)
                }
                Section("Nearby…") {
                    switch loadingState {
                    case .loaded:
                        ForEach(pages, id: \.pageid) { page in
                            Text(placeDescription(title: page.title,
                                                  description: "Page description here")
                            )
                        }
                    case .loading:
                        Text("Loading…")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description

                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await fetchNearbyPlaces()
            }
        }
    }

    private func buildWikipediaURLString() -> String {
        var url = "https://en.wikipedia.org/w/api.php"
        url += "?ggscoord=\(location.latitude)%7C\(location.longitude)"
        url += "&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail"
        url += "&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch"
        url += "&ggsradius=10000&ggslimit=50&format=json"

        return url
    }

    private func fetchNearbyPlaces() async {
        let urlString = buildWikipediaURLString()

        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            // we got some data back!
            let items = try JSONDecoder().decode(Result.self, from: data)

            // success – convert the array values to our pages array
            pages = items.query.pages.values.sorted { $0.title < $1.title }
            loadingState = .loaded
        } catch {
            // if we're still here it means the request failed somehow
            loadingState = .failed
        }
    }

    private func placeDescription(title: String, description: String) -> AttributedString {
        var attributtedTitle = AttributedString(title)
        attributtedTitle.font = .headline

        let separator = AttributedString(": ")

        var attributedDescription = AttributedString(description)
        attributedDescription.font = .body.italic()

        return attributtedTitle + separator + attributedDescription
    }

    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave

        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

#Preview {
    EditPlaceView(location: .example) { _ in }
}
