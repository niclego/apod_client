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
    @Published var selectedDate = Date()
    @Published var imageIsExpanded = true
    @Published var showExplanation = false
    @Published var showComments = false
    @Published var feedView = true
}

struct ContentView: View {
    @ObservedObject var apodObj = ApodObj()
    
    @State private var request: AnyCancellable?
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            if (apodObj.feedView) {
                FeedView(apodObj: apodObj)
            } else {
                Image(systemName: "arrow.triangle.2.circlepath").foregroundColor(.white)
            }
            
            HUDView(apodObj: apodObj)
        }
        .onChange(of: apodObj.selectedDate, perform: apodQuery)
        .onAppear {
            apodQuery(criteria: apodObj.selectedDate)
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
