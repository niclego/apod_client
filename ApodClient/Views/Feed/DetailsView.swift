//
//  ApodDetailsView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct DetailsView: View {
    let title: String
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 1995, month: 6, day: 16)
        return calendar.date(from:startComponents)!
            ...
            Date()
    }()
    
    @Binding var selectedDate: Date
    
    @Binding var showExplanation: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            DatePicker("", selection: $selectedDate, in: dateRange, displayedComponents: .date)
                .labelsHidden()
//                .accentColor(.gray)
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)

            
            Button(action: {
                withAnimation {
                    showExplanation.toggle()
                }
            }) {
                Text(title)
                    .font(.title.weight(.bold))
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
