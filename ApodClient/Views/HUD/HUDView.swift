//
//  HUDView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/19/21.
//

import SwiftUI

struct HUDView: View {
    @ObservedObject var apodObj: ApodObj
    
    var body: some View {
        VStack {
            if (!apodObj.showExplanation) {
                MagnificationButtonView(imageIsExpanded: $apodObj.imageIsExpanded)
            }
            
            Spacer()
            
            DetailsView(apodObj: apodObj)
            if (apodObj.showExplanation) {
                MoreDetailsView(apodObj: apodObj)
            }
        }
    }
}
