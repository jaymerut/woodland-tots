//
//  WeekView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct WeekView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    let week: Date
    let delegate: ScheduleViewProtocol
    let content: (Date) -> DateView

    init(
        week: Date,
        delegate: ScheduleViewProtocol,
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.week = week
        self.delegate = delegate
        self.content = content
    }

    private var days: [Date] {
        guard
            let weekInterval = calendar.dateInterval(of: .weekOfYear, for: week)
            else { return [] }
        return calendar.generateDates(
            inside: weekInterval,
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }

    var body: some View {
        HStack {
            ForEach(days, id: \.self) { date in
                HStack {
                    if self.calendar.isDate(self.week, equalTo: date, toGranularity: .month) {
                        let dateSchedules = self.delegate.getSchedules(date: date)
                        if dateSchedules.count > 0 {
                            NavigationLink(destination: ScheduleListView(viewModel: .init(schedules: dateSchedules))) { content(date) }
                        } else {
                            content(date)
                        }
                    } else {
                        self.content(date).hidden()
                    }
                }
            }
        }
    }
}
