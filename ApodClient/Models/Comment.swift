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
        let date = Date()
        let date2 = Date(timeIntervalSince1970: TimeInterval(id))
        let diffComponents = Calendar.current.dateComponents([.year, .day, .hour, .minute, .second], from: date2, to: date)
        let year = diffComponents.year ?? 0
        let day = diffComponents.day ?? 0
        let hours = diffComponents.hour ?? 0
        let minutes = diffComponents.minute ?? 0
        let seconds = diffComponents.second ?? 0
        
        if (year > 0) {
            return "\(year)y"
        } else if (day > 0){
            if (day < 7) {
                return "\(day)d"
            } else {
                return "\(day / 7)w"
            }
        } else if (hours > 0) {
            return "\(hours)h"
        } else if (minutes > 0) {
            return "\(minutes)m"
        } else {
            return "\(seconds)s"
        }
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
