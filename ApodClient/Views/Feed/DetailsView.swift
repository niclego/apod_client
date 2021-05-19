//
//  ApodDetailsView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct DetailsView: View {
    let title: String
    let likes: Int
    let comments: Int
    
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
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    DatePicker("", selection: $selectedDate, in: dateRange, displayedComponents: .date)
                        .labelsHidden()
                        .accentColor(.gray)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                        
                Button(action: {
                    withAnimation {
                        showExplanation.toggle()
                    }
                }) {
                    Text(title)
                        .font(.title2.weight(.bold))
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            Spacer()
            if !showExplanation {
                ActionButtonsView(likes: likes, comments: comments)
            }
        }
        .padding(16)
        .padding(.bottom, !showExplanation ? 16 : 0)
    }
}
