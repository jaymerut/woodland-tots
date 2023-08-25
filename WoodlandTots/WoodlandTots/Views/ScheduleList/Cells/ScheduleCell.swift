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
    @State private var isPresentingMeals = false
    
    var body: some View {
        ZStack {
            NavigationLink(destination: ScheduleFormView(viewModel: .init(model: item, delegate: self.delegate, mode: .edit)), isActive: $isPresentingEdit) {}
                    .frame(width: 0, height: 0)
                    .hidden()
            
            NavigationLink(destination: ScheduleFormView(viewModel: .init(model: item, delegate: self.delegate, mode: .edit)), isActive: $isPresentingMeals) {}
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
                            isPresentingMeals.toggle()
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
                            isPresentingMeals.toggle()
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
            ]
        ), delegate: ScheduleView(viewModel: .init()))
    }
}
