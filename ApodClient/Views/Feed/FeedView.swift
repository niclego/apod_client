//
//  ApodView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import Combine
import SwiftUI

struct FeedView: View {    
    @State private var apod = Apod.example
    @State var selectedDate = Date()
    @State private var request: AnyCancellable?
    @State var expanded = false

    @Binding var showExplanation: Bool
    @Binding var showApod: Bool


    var body: some View {
        ZStack {
            if (apod.apodType == "imageType") {
                BackgroundImage(path: apod.hdurl ?? apod.url, showExplanation: showExplanation, expanded: expanded)
            } else {
                Color.black
            }
            
            if !showExplanation {
                TopNavigationBar(showApod: $showApod)
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            expanded.toggle()
                        }) {
                            VStack {
                                if (!expanded) {
                                    Image(systemName: "rectangle.expand.vertical")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                } else {
                                    Image(systemName: "rectangle.compress.vertical")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                }

                            }
                            .padding(10)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                        .padding(.top, 32)
                        .padding(.trailing, 16)
                    }

                    Spacer()
                }
                .transition(.move(edge: .trailing))

            }

            VStack(alignment: .leading) {
                DetailsView(title: apod.title, likes: apod.likes, comments: apod.comments, selectedDate: $selectedDate, showExplanation: $showExplanation)
                
                if showExplanation {
                    ExplanationView(explanation: apod.explanation, copyright: apod.copyright, date: apod.id, showExplanation: $showExplanation)
                }
            }
            .frame(
                maxHeight: .infinity,
                alignment: .bottomLeading
            )
            .edgesIgnoringSafeArea(.bottom)
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
            apod = item
        }
    }
}
