//
//  ApodDetailsView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var apodObj: ApodObj
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 1995, month: 6, day: 16)
        return calendar.date(from:startComponents)!
            ...
            Date()
    }()
        
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                DatePicker("", selection: $apodObj.selectedDate, in: dateRange, displayedComponents: .date)
                        .labelsHidden()
                        .accentColor(.white)


                Button(action: {
                    withAnimation {
                        if (!apodObj.showExplanation) {
                            withAnimation {
                                apodObj.showExplanation = true
                                apodObj.showComments = false
                            }
                        } else {
                            withAnimation {
                                apodObj.showExplanation = false
                            }
                        }
                    }
                }) {
                    Text(apodObj.apod.title ?? "")
                        .font(.title.weight(.bold))
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.black.opacity(0.6))
                        .cornerRadius(15)
                }
            }

            
            Spacer()

            ActionButtonsView(apodObj: apodObj)
            
        }
        .padding(16)
    }
}
