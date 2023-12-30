//
//  ScheduleCell.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 8/20/23.
//

import SwiftUI

struct ScheduleCell: View {
    @ObservedObject var item: ScheduleItem
    var delegate: ScheduleFormProtocol
    
    @State private var isPresentingEdit = false
    @State private var isPresentingActivities = false
    @State private var isPresentingMeals = false
    @State private var isPresentingNaps = false
    
    @State private var activityOptions = [SelectOption]()
    
    var body: some View {
        ZStack {
            NavigationLink(destination: ScheduleFormView(viewModel: .init(model: item, delegate: self.delegate, mode: .edit)), isActive: $isPresentingEdit) {}
                    .frame(width: 0, height: 0)
                    .hidden()
            
            NavigationLink(destination: SelectOptionView<ActivityItem>(viewModel: .init(type: .multi, options: activityOptions, valueType: ActivityItem.self), delegate: self).onAppear{ activityOptions = self.getActivityOptions() }, isActive: $isPresentingActivities) {}
                    .frame(width: 0, height: 0)
                    .hidden()
            
            NavigationLink(destination: AddMealsView(viewModel: .init(), delegate: self), isActive: $isPresentingMeals) {}
                    .frame(width: 0, height: 0)
                    .hidden()
            
            HStack(alignment: .top) {
                VStack {
                    Text(item.child.name)
                        .font(FontHelper.fontHelveticaBold(22))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack {
                        ForEach(item.activities) { item in
                            VStack() {
                                Text(item.name)
                                    .font(FontHelper.fontHelveticaBold(18))
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(item.categoryType.rawValue)
                                    .font(FontHelper.fontHelveticaBold(12))
                                    .multilineTextAlignment(.trailing)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 1)
                                Text(item.description)
                                    .font(FontHelper.fontHelveticaNeueItalic(14.0))
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top, 10)
                                    .visibility(item.description.isEmpty ? .gone : .visible)
                            }
                            .padding(.top, 15)
                        }
                    }
                    .padding(.leading, 20)
                }
                
                VStack(alignment: .trailing) {
                    HStack(alignment: .top) {
                        Button() {
                            isPresentingEdit.toggle()
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .background(.gray)
                                .clipShape(Circle())
                        }
                        .buttonStyle(.plain)
                        
        
                        Image(systemName: "trash.fill")
                            .renderingMode(.template)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .background(.red)
                            .clipShape(Circle())
                            .onTapGesture {
                                self.delegate.removeSchedule(schedule: item)
                            }
                    }
                    
                    HStack {
                        Button() {
                            isPresentingActivities.toggle()
                        } label: {
                            Image(systemName: "star.fill")
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .background(.orange)
                                .clipShape(Circle())
                        }
                        .buttonStyle(.plain)
                        
                        Button() {
                            isPresentingMeals.toggle()
                        } label: {
                            Image(systemName: "carrot.fill")
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .background(.green)
                                .clipShape(Circle())
                        }
                        .buttonStyle(.plain)
                    }
                    
                    HStack {
                        Button() {
                            isPresentingNaps.toggle()
                        } label: {
                            Image(systemName: "powersleep")
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .background(.cyan)
                                .clipShape(Circle())
                        }
                        .buttonStyle(.plain)
                        
                    }
                }
            }
            .padding(10)
        }
        
    }
        
    private func getActivityOptions() -> [SelectOption] {
        var options = [SelectOption]()
        for activity in ScheduleHelper.getAllActivities() {
            options.append(.init(name: activity.name, value: activity, isSelected: item.activities.contains(activity)))
        }
        return options
    }
}

extension ScheduleCell: SelectOptionProtocol {
    
    func apply<T>(options: [SelectOption], valueType: T.Type) {
        if valueType is ActivityItem.Type {
            var activities = [ActivityItem]()
            for option in options {
                if let item = option.value as? ActivityItem {
                    activities.append(item)
                }
            }
            
            item.activities = activities
            self.delegate.editSchedule(schedule: item)
        }
    }
}

extension ScheduleCell: AddMealsProtocol {
    
    func add(meal: MealItem) {
        item.meals.removeAll(where: { $0.mealType == meal.mealType})

        item.meals.append(meal)
        item.meals = item.meals.sorted(by: {$0.mealType.rawValue < $1.mealType.rawValue})
        self.delegate.editSchedule(schedule: item)
    }
}


struct ScheduleCell_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCell(item: .init(
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
            ], 
            meals: [
                .init(
                    mealType: .breakfast,
                    note: "test"
                )
            ]
        ), delegate: ScheduleView(viewModel: .init()))
    }
}
