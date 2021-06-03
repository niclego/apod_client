//
//  LikedView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/18/21.
//

import Combine
import SwiftUI

struct SeeAlsoView: View {
    @State private var searchResults = SearchResults(items: [])
    @State private var request: AnyCancellable?
    
    @Binding var selectedDate: Date
    @Binding var showExplanation: Bool

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
                        ForEach(searchResults.items) { item in
                            SeeAlsoCell(apod: item, selectedDate: $selectedDate, showExplanation: $showExplanation )
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 34)
            }
        }
        .onAppear {
            runSearch(criteria: selectedDate)
        }
        .onChange(of: selectedDate, perform: runSearch)

    }
    
    func runSearch(criteria: Date) {
        request?.cancel()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        
        let path = "seeAlso/NASA/" + formatter1.string(from: criteria)

        request = URLSession.shared.get(path: path, defaultValue: SearchResults(items: [])) { items in
            searchResults = items
        }
    }
}
