//
//  MonthView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct MonthView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    let month: Date
    let delegate: ScheduleViewProtocol
    let content: (Date) -> DateView

    init(
        month: Date,
        delegate: ScheduleViewProtocol,
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.month = month
        self.delegate = delegate
        self.content = content
    }

    private var weeks: [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month)
            else { return [] }
        return calendar.generateDates(
            inside: monthInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0, weekday: calendar.firstWeekday)
        )
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Text(DateFormatter.month.string(from: month)).padding(.top, 10)
                ForEach(weeks, id: \.self) { week in
                    WeekView(week: week, delegate: self.delegate, content: self.content)
                }
                Spacer()
            }
        }
    }
}
