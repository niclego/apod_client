//
//  ApodExplanationView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct MoreDetailsView: View {
    @ObservedObject var apodObj: ApodObj

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            apodObj.showComments = false
                        }
                    }, label: {
                        Text("Description")
                            .font(.footnote.weight(.bold))
                            .foregroundColor(!apodObj.showComments ? .white : .white.opacity(0.5))

                    })
                    Button(action: {
                        withAnimation {
                            apodObj.showComments = true
                        }
                    }, label: {
                        Text("Comments (\(apodObj.apod.comments ?? 0))")
                            .font(.footnote.weight(.bold))
                            .foregroundColor(apodObj.showComments ? .white : .white.opacity(0.5))
                    })

                    Spacer()
                    
                }
                .padding(.top, 16)

                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            apodObj.showExplanation.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .font(.title2.weight(.bold))
                    })
                }
                .padding(.top, 16)
                .padding(.bottom, 4)
                .padding(.horizontal, 17)
            }

            

            if !apodObj.showComments {
                ExplanationView(apodObj: apodObj)
            } else {
                CommentsView(apodObj: apodObj)
            }
        }
        .foregroundColor(.white)
        .background(Color.black.opacity(0.6))
//        .cornerRadius(15)
        .transition(.move(edge: .bottom))
        .frame(
            maxHeight: .infinity,
            alignment: .bottomLeading
        )
    }
}
