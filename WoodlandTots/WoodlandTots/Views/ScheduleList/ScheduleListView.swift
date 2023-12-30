//
//  ScheduleListView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 8/20/23.
//

import SwiftUI

struct ScheduleListView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        return NavigationView() {
            VStack() {
                List {
                    ForEach(viewModel.schedules) { item in
                        ZStack {
                            NavigationLink {
                                ChildSummaryView(viewModel: .init(schedule: item))
                            } label: {
                                EmptyView()
                            }
                            
                            ScheduleCell(item: item, delegate: self)
                                .listRowInsets(.init(top: 5, leading: 5, bottom: 5, trailing: 5))
                                .buttonStyle(PlainButtonStyle())
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top, 10)
            }
        }
        .navigationTitle("Schedules")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension ScheduleListView: ScheduleFormProtocol {
    func addSchedule(schedule: ScheduleItem) {

    }
    
    func editSchedule(schedule: ScheduleItem) {
        if let row = self.viewModel.schedules.firstIndex(where: { $0.id == schedule.id }) {
            self.viewModel.schedules.insert(schedule, at: row)
            self.viewModel.schedules.remove(at: row)
            
            SwiftAppDefaults.add(.scheduleModels, ScheduleModelMapper.convertScheduleItemToScheduleModels(models: self.viewModel.schedules))
        }
    }
    
    func removeSchedule(schedule: ScheduleItem) {
        if let row = self.viewModel.schedules.firstIndex(where: { $0.id == schedule.id }) {
            self.viewModel.schedules.remove(at: row)
            SwiftAppDefaults.add(.scheduleModels, ScheduleModelMapper.convertScheduleItemToScheduleModels(models: self.viewModel.schedules))
        }
    }
}

struct ScheduleListView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListView(viewModel:
            .init(
                schedules:[
                    .init(
                        id: UUID().uuidString,
                        date: .now,
                        child: .init(
                            id: UUID().uuidString,
                            name: "Test",
                            age: 1,
                            ageUnits: .months,
                            note: "Test Me"
                        ),
                        activities: [
                            .init(
                                id: UUID().uuidString,
                                name: "Test Me Activity",
                                categoryType: .art,
                                description: "Test"
                            ),
                            .init(
                                id: UUID().uuidString,
                                name: "Test Me Activity 2",
                                categoryType: .language,
                                description: "Test 2"
                            )
                        ], meals: [
                            .init(
                                mealType: .breakfast, note: "Test"
                            )
                        ]
                    )
                ]
            )
        )
    }
}
