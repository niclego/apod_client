//
//  ContentView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/6/21.
//

import Combine
import SwiftUI

class ApodObj: ObservableObject {
    @Published var apod = Apod.example
    @Published var imageIsExpanded = false
}

struct ContentView: View {
    @StateObject var apodObj = ApodObj()
    @State private var feedView = true
    @State private var selectedDate = Date()
    @State private var request: AnyCancellable?
    @State private var showExplanation = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            if (feedView) {
                FeedView(apodObj: self.apodObj, showExplanation: showExplanation)
            } else {
                Color.red
            }
            
            HUDView(
                apodObj: apodObj,
                feedView: $feedView,
                selectedDate: $selectedDate,
                showExplanation: $showExplanation
            )
        }
        .onChange(of: selectedDate, perform: apodQuery)
        .onAppear {
            apodQuery(criteria: selectedDate)
        }
    }
    
    func apodQuery(criteria: Date) {
        request?.cancel()

        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"

        let path = "apod/NASA/" + formatter1.string(from: criteria)

        request = URLSession.shared.get(path: path, queryItems: [:], defaultValue: Apod.example) { item in
            apodObj.apod = item
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
