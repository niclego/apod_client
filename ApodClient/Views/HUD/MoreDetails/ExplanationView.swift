//
//  DescriptionView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/21/21.
//

import SwiftUI

struct ExplanationView: View {
    @ObservedObject var apodObj: ApodObj

    var body: some View {
        ScrollView(.vertical) {
            Text(apodObj.apod.explanation ?? "")
                .font(.body.weight(.bold))
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            
            
            if let copyright = apodObj.apod.copyright {
                HStack {
                    Button(action: {}, label: {
                        Text("© \(copyright)")
                            .foregroundColor(.gray)
                            .font(.footnote.weight(.bold))
                            .padding(.bottom, 10)
                    })
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            
            SeeAlsoView(selectedDate: $apodObj.selectedDate)
        }
    }
}

//struct DescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionView()
//    }
//}
