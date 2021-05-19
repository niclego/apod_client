//
//  ApodBackgroundImage.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct BackgroundImage: View {
    let path: String
    let showExplanation: Bool
    let expanded: Bool
    
    var body: some View {
        WebImage(url: URL(string: self.path))
            .placeholder(Image("Loading").resizable())
            .resizable()
            .aspectRatio(contentMode: expanded ? .fill : .fit)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .ignoresSafeArea()
            .blur(radius: showExplanation ? 10 : 0)
            .animation(.linear(duration: 0.4))
    }
    
}
