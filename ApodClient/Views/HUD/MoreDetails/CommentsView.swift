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
    @State var value: CGFloat = 0
    @State var scrollDown = false
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical) {
                ScrollViewReader { scrollView in
                    if !searchResults.items.isEmpty {
                        ForEach(searchResults.items.reversed()) { item in
                            CommentCell(comment: item)
                                .id(item.id)
                        }
                        .onChange(of: scrollDown, perform: { s in
                            print("scroll")
                            withAnimation {
                                scrollTo(with: scrollView)
                            }
                        })
                        .onAppear {
                            scrollTo(with: scrollView)
                        }
                    } else {
                        Text("There are no comments yet.")
                    }
                }
            }
            .frame(maxWidth: .infinity)

            HStack {
                HStack {
                    ZStack(alignment: .leading) {
                        if commentText.isEmpty {
                            Text("Send your comment").foregroundColor(.white.opacity(0.5))
                        }
                        TextField("", text: $commentText)
                            .foregroundColor(.white)
                            .accentColor(.white)
                    }
                    Button(action: {
                        if !commentText.isEmpty {
                            postComment()
                        }
                    }, label: {
                        Image(systemName: "paperplane.circle")
                            .font(.title2.weight(.bold))
                            .foregroundColor(.white)
                    })
                }
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 1)
                )

            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .padding(.horizontal, 10)
            .background(Color.black.opacity(0.1))
        }
        .onAppear {
            fetchComments(criteria: apodObj.selectedDate)
        }
        .onChange(of: apodObj.selectedDate, perform: fetchComments)
    }
    
    func scrollTo(with value: ScrollViewProxy) {
        if searchResults.items.isEmpty {
            return
        } else {
            value.scrollTo(searchResults.items[0].id, anchor: .bottom)
        }
    }
    
    func fetchComments(criteria: Date) {
        request?.cancel()
        print("fetching...")
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd"
        
        let path = "comments/NASA/" + formatter1.string(from: criteria)
        
        request = URLSession.shared.get(path: path, queryItems: [:], defaultValue: CommentSearchResults(items: [])) { items in
            searchResults = items
            scrollDown.toggle()
        }
    }
    
    func postComment() {
        let c = Comment(id: 0, type: "\(apodObj.apod.type)#\(apodObj.apod.id)", commentText: commentText, author: "bot", likes: 0)
        request = URLSession.shared.post(c, to: URL(string: "https://we046wmwwi.execute-api.us-east-2.amazonaws.com/develop/comments")!) { item in
            fetchComments(criteria: apodObj.selectedDate)
            commentText = ""
            hideKeyboard()
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView(typeDate: "NASA#2021-05-07")
//    }
//}
