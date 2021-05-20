//
//  ApodDetailsView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var apodObj: ApodObj
    @Binding var selectedDate: Date
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 1995, month: 6, day: 16)
        return calendar.date(from:startComponents)!
            ...
            Date()
    }()
        
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    DatePicker("", selection: $selectedDate, in: dateRange, displayedComponents: .date)
                        .labelsHidden()
                        .accentColor(.white)
                }
                        
                Button(action: {
                    withAnimation {
                        apodObj.showExplanation.toggle()
                    }
                }) {
                    Text(apodObj.apod.title)
                        .font(.title2.weight(.bold))
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(10)
                }
            }
            Spacer()
            if !apodObj.showExplanation {
                ActionButtonsView(likes: apodObj.apod.likes, comments: apodObj.apod.comments)
            }
        }
        .padding(16)
        .padding(.bottom, true ? 16 : 0)
    }
}
