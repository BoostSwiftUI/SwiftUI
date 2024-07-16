//
//  HomeView.swift
//  PillyzeClone
//
//  Created by Mason Kim on 7/16/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedDate: Date = .now

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                NavigationBar()
                    .padding(.vertical, 8)

                WeeklyDatePicker(
                    selectedDate: $selectedDate,
                    startRangeDate: .now.beforeDate(dayBefore: 100),
                    endRangeDate: .now
                )

                Text("Hello, World!")
            }
        }
        .background(.primaryNormal)
    }
}

// MARK: - Inner Views

fileprivate struct NavigationBar: View {
    var body: some View {
        HStack {
            Image(.logo)
                .resizable()
                .frame(width: 88, height: 23)

            Spacer()

            HStack(spacing: 8) {
                Button {

                } label: {
                    Image(.icHeaderCalendar)
                }

                Button {

                } label: {
                    Image(.icHeaderAlarm)
                }
                
                Button {

                } label: {
                    Image(.icHeaderUser)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}


// MARK: - Preview

#Preview {
    HomeView()
}
