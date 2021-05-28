//
//  CommentCell.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/23/21.
//

import SwiftUI

struct CommentCell: View {
    let comment: Comment
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "u.circle")
                .font(.title2)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("@\(comment.author)")
                        .font(.footnote.weight(.bold))
                        .padding(.bottom, 1)
                    Text("\(comment.date)")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.footnote)
                        .padding(.bottom, 1)
                }
                Text(comment.commentText)
                    .font(.footnote)
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "heart")
            })
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        
        Rectangle()
            .fill(Color.black.opacity(0.2))
            .frame(maxWidth: .infinity, maxHeight: 1)
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell(comment: Comment.example)
    }
}
