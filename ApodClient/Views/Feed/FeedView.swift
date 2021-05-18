//
//  ApodView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import Combine
import SwiftUI

struct FeedView: View {
    let feedType: String
    
    @State private var nasaApod = Apod.example
    @State var selectedDate = Date()
    @State private var request: AnyCancellable?

    @Binding var showExplanation: Bool


    var body: some View {
        ZStack {
            BackgroundImage(hdurl: nasaApod.hdurl, showExplanation: showExplanation)

            VStack {
                VStack(alignment: .leading) {
                    if !showExplanation {
                        ActionButtonsView(likes: nasaApod.likes, comments: nasaApod.comments)
                    }

                    DetailsView(title: nasaApod.title, selectedDate: $selectedDate, showExplanation: $showExplanation)
                        .padding(.bottom, !showExplanation ? 16 : 0)

                    if showExplanation {
                        ExplanationView(explanation: nasaApod.explanation, copyright: nasaApod.copyright, showExplanation: $showExplanation)
                    }
                }
                .frame(
                    maxHeight: .infinity,
                    alignment: .bottomLeading
                )
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .onChange(of: selectedDate, perform: apodQuery)
    }
    
    func apodQuery(criteria: Date) {
        request?.cancel()

        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"

        let path = formatter1.string(from: criteria)
        
        request = URLSession.shared.get(path: path, queryItems: [:], defaultValue: Apod.example) { item in
            nasaApod = item
        }
    }
}
