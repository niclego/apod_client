//
//  CommentsView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/21/21.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                ForEach(1..<20) { index in
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("@username\(index)")
                                    .font(.footnote.weight(.bold))
                                    .padding(.bottom, 1)
                                Text("1h")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.footnote)
                                    .padding(.bottom, 1)
                            }
                            
                            Text("comments context")
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .cornerRadius(15)
                    Rectangle()
                        .fill(Color.black.opacity(0.2))
                        .frame(maxWidth: .infinity, maxHeight: 1)

                }
            }
            .frame(maxWidth: .infinity)

            HStack {
                ZStack(alignment: .leading) {
                    if commentText.isEmpty { Text("Send your comment").foregroundColor(.white.opacity(0.5)) }
                    TextField("Test", text: $commentText)
                }
                .foregroundColor(.white)
                .padding(5)
                .padding(.horizontal, 10)
                .background(Color.black.opacity(0.2))
                .cornerRadius(15)

                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                })
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
            .padding(10)
            .padding(.bottom, 22)
            .padding(.horizontal, 10)
            .background(Color.black.opacity(0.2))
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
