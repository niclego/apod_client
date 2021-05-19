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
    let showExplanation: Bool

    var body: some View {
        WebImage(url: URL(string: self.apodObj.apod.hdurl ?? self.apodObj.apod.url))
            .placeholder(Image("Loading").resizable())
            .resizable()
            .aspectRatio(contentMode: apodObj.imageIsExpanded ? .fill : .fit)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .ignoresSafeArea()
            .blur(radius: showExplanation ? 10 : 0)
            .animation(.linear(duration: 0.4))
    }
    
}
