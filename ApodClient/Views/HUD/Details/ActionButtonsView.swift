//
//  ActionButtonsView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct ActionButtonsView: View {
    @ObservedObject var apodObj: ApodObj
    
    var body: some View {
        VStack {
            ActionButton(apodObj: apodObj, systemName: "heart") {
                print("hello")
            }
            ActionButton(apodObj: apodObj, systemName: "ellipsis.bubble", onPress: onCommentsPress)
        }
        .padding(10)
        .background(Color.black.opacity(0.6))
        .cornerRadius(15)
        .transition(.move(edge: .trailing))
    }
    
    func onCommentsPress() {
        if (!apodObj.showExplanation) {
            withAnimation {
                apodObj.showExplanation = true
                apodObj.showComments = true
            }
        } else {
            if (!apodObj.showComments) {
                withAnimation {
                    apodObj.showComments = true
                }
            } else {
                withAnimation {
                    apodObj.showExplanation = false
                }
            }
        }
    }
}
