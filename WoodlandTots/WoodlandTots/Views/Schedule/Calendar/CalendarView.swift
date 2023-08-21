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
    let delegate: ScheduleViewProtocol
    let content: (Date) -> DateView

    init(
        interval: DateInterval,
        delegate: ScheduleViewProtocol,
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.interval = interval
        self.delegate = delegate
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
            MultiPageView(pages: months.map({ MonthView(month: $0, delegate: self.delegate, content: self.content) }), currentPageIndex: $selection)
                .onAppear {
                    self.selection = months.firstIndex(where: { DateFormatter.month.string(from: $0) == DateFormatter.month.string(from: Date()) }) ?? 0
                }
        }
    }
}

