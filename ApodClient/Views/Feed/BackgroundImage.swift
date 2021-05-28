//
//  ApodBackgroundImage.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct BackgroundImage: View {
    @ObservedObject var apodObj: ApodObj

    var body: some View {
        WebImage(url: URL(string: self.apodObj.apod.hdurl ?? self.apodObj.apod.url))
            .placeholder(Image(systemName: "arrow.triangle.2.circlepath"))
            .resizable()
            .aspectRatio(contentMode: apodObj.imageIsExpanded ? .fill : .fit)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .ignoresSafeArea()
            .blur(radius: apodObj.showExplanation ? 10 : 0)
            .animation(.linear(duration: 0.4))
    }
    
}
