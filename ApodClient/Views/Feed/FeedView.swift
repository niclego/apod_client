//
//  ApodView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var apodObj: ApodObj

    var body: some View {
        ZStack {
            if (apodObj.apod.apodType == "imageType") {
                BackgroundImage(apodObj: apodObj)
            } else {
                Color.black
            }
        }
    }
}
