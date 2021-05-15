//
//  NasaApod.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//
import Foundation

struct NasaApod {
    let title: String = "Mercury-Redstone 3 Launch"
    let hdUrl: String = ""
    let url: String = ""
    let copyright: String = "Adam Krutch"
    let explanation: String = """
        Sixty years ago, near the dawn of the space age, NASA controllers \"lit the candle\" and sent Mercury astronaut Alan Shepard arcing into space atop a Redstone rocket. His cramped space capsule was dubbed Freedom 7. Broadcast live to a global television audience, the historic Mercury-Redstone 3 (MR-3) spacecraft was launched from Cape Canaveral Florida at 9:34 a.m. Eastern Time on May 5, 1961. The flight of Freedom 7, the first space flight by an American, followed less than a month after the first human venture into space by Soviet Cosmonaut Yuri Gagarin. The 15 minute sub-orbital flight achieved an altitude of 116 miles and a maximum speed of 5,134 miles per hour. As Shepard looked back near the peak of Freedom 7's trajectory, he could see the outlines of the west coast of Florida, Lake Okeechobe in central Florida, the Gulf of Mexico, and the Bahamas. Shepard would later view planet Earth from a more distant perspective and walk on the Moon as commander of the Apollo 14 mission.
    """
    let date: String = "2021-05-07"
    let likes: Int = 12
    let comments: Int = 4
    let shares: Int = 8
    
    var formatedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let myDate = dateFormatter.date(from: date)!

        dateFormatter.dateFormat = "MMM dd, YYYY"
        let somedateString = dateFormatter.string(from: myDate)
        return somedateString
    }
}
