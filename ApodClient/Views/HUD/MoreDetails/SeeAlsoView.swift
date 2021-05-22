//
//  LikedView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/18/21.
//

import Combine
import SwiftUI

struct SeeAlsoView: View {
    @ObservedObject var apodObj: ApodObj
    @State private var searchResults = SearchResults(items: [])
    @State private var request: AnyCancellable?
    @Binding var selectedDate: Date

    var body: some View {
        VStack {
            if !searchResults.items.isEmpty {
                HStack {
                    Text("See Also:")
                        .font(.title2.weight(.bold))
                        .padding(.bottom, 10)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(searchResults.items, content: SeeAlsoCell.init)
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 34)
            }
        }
        .onAppear {
            runSearch()
        }
        .onChange(of: selectedDate.description) { s in
            runSearch()
        }
    }
    
    func runSearch() {
        request?.cancel()

        request = URLSession.shared.get(path: "seeAlso/NASA/\(apodObj.apod.id)", defaultValue: SearchResults(items: [])) { items in
            searchResults = items
        }
    }
}

//struct LikedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SeeAlsoView(date: "2021-05")
//    }
//}
