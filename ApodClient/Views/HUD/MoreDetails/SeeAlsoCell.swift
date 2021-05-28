//
//  SeeAlsoCell.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/18/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct SeeAlsoCell: View {
    let apod: Apod
    @Binding var selectedDate: Date
    @Binding var showExplanation: Bool

    var posterImage: some View {
        Group {
            if let path = apod.hdurl ?? apod.url {
                WebImage(url: URL(string: path))
                    .placeholder(Image(systemName: "arrow.triangle.2.circlepath"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 86, height: 86)
                    .cornerRadius(15)
            } else {
                Image("NoPoster")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 86, height: 86)
                    .cornerRadius(15)
            }
        }
    }
    
    var body: some View {
        Button(action: {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: apod.id)
            selectedDate = date ?? Date()
            withAnimation {
                showExplanation = false
            }
        }, label: {
            posterImage
        })
    }
    
}

//struct SeeAlsoCell_Previews: PreviewProvider {
//    static var previews: some View {
//        SeeAlsoCell(apod: Apod.example)
//    }
//}
