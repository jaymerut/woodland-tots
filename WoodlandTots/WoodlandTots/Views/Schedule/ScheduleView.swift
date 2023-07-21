//
//  ScheduleView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct ScheduleView: View {

    @State private var selection: String? = nil
    @ObservedObject var viewModel: ViewModel
    
    @Environment(\.calendar) var calendar

    private var year: DateInterval {
        calendar.dateInterval(of: .year, for: Date())!
    }
    
    var body: some View {
        return NavigationStack() {
            VStack {
                HStack() {
                    CalendarView(interval: year) { date in
                        Text("30")
                            .hidden()
                            .padding(8)
                            .background(Color.green)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .padding(.vertical, 4)
                            .overlay(
                                VStack {
                                    Text(String(self.calendar.component(.day, from: date)))
                                        .fontWeight(.bold)
                                }
                            )
                    }
                }
            }
            .navigationTitle("Schedule")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(viewModel: .init())
    }
}
