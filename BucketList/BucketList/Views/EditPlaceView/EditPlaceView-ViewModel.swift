//
//  EditPlace-ViewModel.swift
//  BucketList
//
//  Created by Javier Castañeda on 13/08/26.
//

import SwiftUI

extension EditPlaceView {
    enum ViewState {
        case loading
        case loaded
        case failed
    }
    
    @Observable
    final class ViewModel {
        private let location: Location
        var pages: [Page] = []
        var viewState: ViewState = .loading
        var newName: String
        var newDescription: String

        init(location: Location) {
            self.location = location
            newName = location.name
            newDescription = location.description
        }

        private func buildNearbyPlacesURLString() -> String {
            var url = "https://en.wikipedia.org/w/api.php"
            url += "?ggscoord=\(location.latitude)%7C\(location.longitude)"
            url += "&action=query&prop=coordinates%7Cpageimages%7Cpageterms"
            url += "&colimit=50&piprop=thumbnail"
            url += "&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch"
            url += "&ggsradius=10000&ggslimit=50&format=json"

            return url
        }

        func fetchNearbyPlaces() async {
            let urlString = buildNearbyPlacesURLString()

            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)

                // we got some data back!
                let items = try JSONDecoder().decode(Result.self, from: data)

                // success – convert the array values to our pages array
                pages = items.query.pages.values.sorted()
                viewState = .loaded
            } catch {
                // if we're still here it means the request failed somehow
                viewState = .failed
            }
        }

        func locationToUpdate() -> Location {
            var newLocation = location
            newLocation.id = UUID()
            newLocation.name = newName
            newLocation.description = newDescription

            return newLocation
        }
    }
}

extension Page {
    var placeAttributedDescription: AttributedString {
        var attributtedTitle = AttributedString(title)
        attributtedTitle.font = .headline

        let separator = AttributedString(": ")

        var attributedDescription = AttributedString(description)
        attributedDescription.font = .body.italic()

        return attributtedTitle + separator + attributedDescription
    }
}
