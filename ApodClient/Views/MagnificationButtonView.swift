//
//  MagnificationButtonView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/19/21.
//

import SwiftUI

struct MagnificationButtonView: View {
    @ObservedObject var apodObj: ApodObj

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                apodObj.imageIsExpanded.toggle()
            }) {
                if (apodObj.imageIsExpanded) {
                    Image(systemName: "rectangle.expand.vertical")
                        .foregroundColor(.white)
                        .font(.title2.weight(.bold))
                } else {
                    Image(systemName: "rectangle.compress.vertical")
                        .foregroundColor(.white)
                        .font(.title2.weight(.bold))
                }
            }
            .padding(10)
            .background(Color.black.opacity(0.6))
            .cornerRadius(15)
        }
        .padding(.trailing, 16)
        .transition(.move(edge: .trailing))
    }
}

//struct MagnificationButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        MagnificationButtonView()
//    }
//}
