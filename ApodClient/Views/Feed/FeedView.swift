//
//  ApodView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct FeedView: View {
    @State var showExplanation = false
    let feedType: String
    let nasaApod = NasaApod()

    var body: some View {
        ZStack {
            BackgroundImage(imageName: feedType == "APOD" ? "APOD2" : "APOD1", showExplanation: showExplanation)

            VStack {
                VStack(alignment: .leading) {
                    if !showExplanation {
                        ActionButtonsView(likes: nasaApod.likes, comments: nasaApod.comments, shares: nasaApod.shares)
                    }
                    
                    Button(action: {
                        withAnimation {
                            showExplanation.toggle()
                        }
                    }, label: {
                        DetailsView(title: nasaApod.title, formatedDate: nasaApod.date, copyright: nasaApod.copyright)
                    })
                        
                    if showExplanation {
                        ExplanationView(explanation: nasaApod.explanation, showExplanation: $showExplanation)
                    }
                }
                .frame(
                    maxHeight: .infinity,
                    alignment: .bottomLeading
                )
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}
