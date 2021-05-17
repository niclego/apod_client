//
//  ApodExplanationView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct ExplanationView: View {
    let explanation: String
    let copyright: String

    @Binding var showExplanation: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Description")
                    .font(.footnote.weight(.bold))
                Spacer()
                Button(action: {
                    withAnimation {
                        showExplanation.toggle()
                    }
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.title3.weight(.bold))
                })
            }
            .padding(.top, 10)
            .padding(.bottom, 4)
            .padding(.horizontal, 10)

            

            
            ScrollView(.vertical) {
                Text(explanation)
                    .font(.body.weight(.bold))
                    .padding(.horizontal, 10)
                

                if !copyright.isEmpty {
                    HStack {
                        Button(action: {}, label: {
                            Text("📷 ©\(copyright)")
                                .foregroundColor(.white)
                                .font(.footnote.weight(.bold))
                                .padding(.vertical, 10)
                        })

                        Spacer()
                    }
                    .padding(.horizontal, 10)
                }
                
                HStack {
                    Text("More Like this:")
                        .font(.footnote.weight(.bold))
                        .padding(.bottom, 10)

                    Spacer()
                }
                .padding(.horizontal, 10)

                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<7, content: {_ in
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Color.white.opacity(0.6)
                                    .frame(width: 80, height: 128)
                                    .cornerRadius(10)
                            })
                        })
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 16)
                }
            }
            



        }
        .foregroundColor(.white)
        .background(Color.black.opacity(0.6))
        .cornerRadius(10)
        .transition(.move(edge: .bottom))
        .frame(
            alignment: .bottomLeading
        )
    }
}
