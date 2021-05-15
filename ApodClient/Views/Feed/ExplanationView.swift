//
//  ApodExplanationView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct ExplanationView: View {
    let explanation: String
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
            .padding(.top, 8)
            .padding(.bottom, 4)
            

            
            ScrollView(.vertical) {
                Text(explanation)
                    .font(.body.weight(.bold))
            }

        }
        .foregroundColor(.white)
        .padding(.bottom, 16)
        .padding(.horizontal, 16)
        .background(Color.black.opacity(0.6))
        .cornerRadius(10)
        .transition(.move(edge: .bottom))
        .frame(
            maxHeight: 572,
            alignment: .bottomLeading
        )
    }
}
