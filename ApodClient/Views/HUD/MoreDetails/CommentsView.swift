//
//  CommentsView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/21/21.
//

import Combine
import SwiftUI

struct CommentsView: View {
    @ObservedObject var apodObj: ApodObj

    @State private var searchResults = CommentSearchResults(items: [])
    @State private var request: AnyCancellable?
    @State var commentText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                ForEach(searchResults.items, content: CommentCell.init)
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

                Button(action: {
                    postComment()
                }, label: {
                    Image(systemName: "paperplane.circle")
                })
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
            .padding(10)
            .padding(.bottom, 22)
            .padding(.horizontal, 10)
            .background(Color.black.opacity(0.2))
        }
        .onAppear {
            fetchComments(criteria: apodObj.selectedDate)
        }
        .onChange(of: apodObj.selectedDate, perform: fetchComments)
    }
    
    func fetchComments(criteria: Date) {
        request?.cancel()
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        
        let path = "comments/NASA/" + formatter1.string(from: criteria)
        print(path)
        
        request = URLSession.shared.get(path: path, queryItems: [:], defaultValue: CommentSearchResults(items: [])) { items in
            searchResults = items
        }
    }
    
    func postComment() {
        let c = Comment(id: 0, type: "NASA#2021-05-07", commentText: "Hello World", author: "nlegorrec", likes: 0)
        var comments = searchResults.items
        comments.append(c)
        let newResults = CommentSearchResults(items: comments)
        searchResults = newResults
    }
}

//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView(typeDate: "NASA#2021-05-07")
//    }
//}
