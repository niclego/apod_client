//
//  Apod.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/18/21.
//

import Foundation

struct Apod: Codable, Identifiable {
    let type: String
    let id: String
    let title: String
    let explanation: String
    let hdurl: String?
    let url: String
    let copyright: String?
    let likes: Int
    let comments: Int
    
    var formatedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let myDate = dateFormatter.date(from: id)!
        
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: myDate)
        return somedateString
    }
    
    var apodType: String {
        if (hdurl != nil) {
            return "imageType"
        } else {
            if (url.contains("youtube")) {
                return "youtubeType"
            } else {
                return "webType"
            }
        }
    }
    
    static let example = Apod(
        type: "",
        id: "",
        title: "",
        explanation: "",
        hdurl: "",
        url: "",
        copyright: nil,
        likes: 0,
        comments: 0
    )
}

struct SearchResults: Decodable {
    let items: [Apod]
    
    enum CodingKeys: String, CodingKey {
        case items = "Items"
    }
}

