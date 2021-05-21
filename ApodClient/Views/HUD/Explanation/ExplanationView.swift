//
//  ApodExplanationView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct ExplanationView: View {
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
                        Text("Comments (\(apodObj.apod.comments))")
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
                .padding(.horizontal, 10)
            }

            

            if !apodObj.showComments {
                ScrollView(.vertical) {
                    Text(apodObj.apod.explanation)
                        .font(.body.weight(.bold))
                        .padding(.horizontal, 10)
                        .padding(.bottom, 10)
                    

                    if let copyright = apodObj.apod.copyright {
                        HStack {
                            Button(action: {}, label: {
                                Text("© \(copyright)")
                                    .foregroundColor(.gray)
                                    .font(.footnote.weight(.bold))
                                    .padding(.bottom, 10)
                            })

                            Spacer()
                        }
                        .padding(.horizontal, 10)
                    }
                    
                    SeeAlsoView(apodObj: apodObj)
                }
            } else {
                ScrollView(.vertical) {
                    ForEach(1..<20) { index in
                        HStack {
                            Text("Comment \(index)")
                            Spacer()
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(15)                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
            }
        }
        .foregroundColor(.white)
        .background(Color.black.opacity(0.6))
        .cornerRadius(15)
        .transition(.move(edge: .bottom))
        .frame(
            maxHeight: .infinity,
            alignment: .bottomLeading
        )
        .edgesIgnoringSafeArea(.bottom)
    }
}
