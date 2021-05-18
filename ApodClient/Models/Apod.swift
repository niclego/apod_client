//
//  Apod.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/18/21.
//

import Foundation

struct Apod: Decodable, Identifiable {
    let type: String
    let id: String
    let title: String
    let explanation: String
    let hdurl: String
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
    
    static let example = Apod(
        type: "NASA",
        id: "2021-05-16",
        title: "NGC 602 and Beyond",
        explanation: "The clouds may look like an oyster, and the stars like pearls, but look beyond. Near the outskirts of the Small Magellanic Cloud, a satellite galaxy some 200 thousand light-years distant, lies 5 million year young star cluster NGC 602. Surrounded by natal gas and dust, NGC 602 is featured in this stunning Hubble image of the region. Fantastic ridges and swept back shapes strongly suggest that energetic radiation and shock waves from NGC 602's massive young stars have eroded the dusty material and triggered a progression of star formation moving away from the cluster's center. At the estimated distance of the Small Magellanic Cloud, the featured picture spans about 200 light-years, but a tantalizing assortment of background galaxies are also visible in this sharp multi-colored view. The background galaxies are hundreds of millions of light-years or more beyond NGC 602.",
        hdurl: "https://apod.nasa.gov/apod/image/2105/Ngc602_Hubble_3749.jpg",
        url: "https://apod.nasa.gov/apod/image/2105/Ngc602_Hubble_960.jpg",
        copyright: nil,
        likes: 0,
        comments: 0
    )
}
