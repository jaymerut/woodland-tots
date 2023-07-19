//
//  CalendarView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct CalendarView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar
    @State var selection = 0

    let interval: DateInterval
    let content: (Date) -> DateView

    init(
        interval: DateInterval,
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.interval = interval
        self.content = content
    }

    private var months: [Date] {
        calendar.generateDates(
            inside: interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }
    

    var body: some View {
        VStack {
            MultiPageView(pages: months.map({ MonthView(month: $0, content: self.content) }), currentPageIndex: $selection)
                .onAppear {
                    self.selection = months.firstIndex(where: { DateFormatter.month.string(from: $0) == DateFormatter.month.string(from: Date()) }) ?? 0
                }
        }
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
            }
        }
    }
}

