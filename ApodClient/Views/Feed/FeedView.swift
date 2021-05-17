//
//  ApodView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct FeedView: View {
    let feedType: String
    let nasaApod = NasaApod()
    @Binding var showExplanation: Bool


    var body: some View {
        ZStack {
            BackgroundImage(imageName: feedType == "APOD" ? "APOD2" : "APOD1", showExplanation: showExplanation)

            VStack {
                VStack(alignment: .leading) {
                    if !showExplanation {
                        ActionButtonsView(likes: nasaApod.likes, comments: nasaApod.comments, shares: nasaApod.shares)
                    }

                    DetailsView(title: nasaApod.title, formatedDate: nasaApod.date, showExplanation: $showExplanation)
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
    }
}
