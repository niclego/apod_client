//
//  ApodBackgroundImage.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct BackgroundImage: View {
    let imageName: String
    let showExplanation: Bool
    
    var body: some View {
        Image(self.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .ignoresSafeArea()
            .blur(radius: showExplanation ? 10 : 0)
            .animation(.linear(duration: 0.4))
    }
    
}
