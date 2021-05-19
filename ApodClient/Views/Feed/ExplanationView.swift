//
//  ApodExplanationView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct ExplanationView: View {
    let explanation: String
    let copyright: String?
    let date: String

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
                    .padding(.bottom, 10)
                

                if let copyright = copyright {
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
                
                SeeAlsoView(date: date)
            }
        }
        .foregroundColor(.white)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .transition(.move(edge: .bottom))
        .frame(
            alignment: .bottomLeading
        )
    }
}
