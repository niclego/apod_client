//
//  Comment.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/23/21.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: Int
    let type: String
    let commentText: String
    let author: String
    let likes: Int
    
    static let example = Comment(id: 1, type: "NASA#2021-05-07", commentText: "test comment", author: "nlegorrec", likes: 1)
}

struct CommentSearchResults: Decodable {
    let items: [Comment]
    
    enum CodingKeys: String, CodingKey {
        case items = "Items"
    }
}
