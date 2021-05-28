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
    
    var date: String {

        let date = Date(timeIntervalSince1970: TimeInterval(id))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        return localDate
//        return myDate.timeAgoDisplay()
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
//        dateFormatter.dateStyle = DateFormatter.Style.short //Set date style
//        dateFormatter.timeZone = .current
//        let localDate = dateFormatter.string(from: myDate)
//        return localDate.description
    }
    
    static let example = Comment(id: 1, type: "NASA#2021-05-07", commentText: "test comment", author: "nlegorrec", likes: 1)
}

struct CommentSearchResults: Decodable {
    let items: [Comment]
    
    enum CodingKeys: String, CodingKey {
        case items = "Items"
    }
}

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
