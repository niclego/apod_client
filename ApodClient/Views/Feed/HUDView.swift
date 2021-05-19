//
//  HUDView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/19/21.
//

import SwiftUI

struct HUDView: View {
    @ObservedObject var apodObj: ApodObj
    
    @Binding var feedView: Bool
    @Binding var selectedDate: Date
    @Binding var showExplanation: Bool
    
    var body: some View {
        VStack {
            if (!showExplanation) {
                TopNavigationBar(feedView: $feedView)
                MagnificationButtonView(apodObj: apodObj)
            }
            Spacer()
            DetailsView(apodObj: apodObj, showExplanation: $showExplanation, selectedDate: $selectedDate)
            if (showExplanation) {
                ExplanationView(apodObj: apodObj, showExplanation: $showExplanation)
            }
        }
    }
}

//struct HUDView_Previews: PreviewProvider {
//    static var previews: some View {
//        HUDView(feedView: <#T##Binding<Bool>#>)
//    }
//}