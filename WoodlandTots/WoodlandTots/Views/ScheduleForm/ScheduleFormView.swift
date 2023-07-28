//
//  ScheduleFormView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/21/23.
//

import SwiftUI

struct ScheduleFormView: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    
    @State private var scheduleDate = Date.now
    @State private var selectedChild: ChildItem = .init()
    @State private var selectedActivity: ActivityItem = .init()
    @State private var childText: String = "No child selected"
    @State private var activityText: String = "0 activities selected"
    
    var body: some View {
        return NavigationStack() {
            VStack(alignment: .leading) {
                
                ScrollView() {
                    HStack {
                        VStack {
                            
                            DatePicker(selection: $scheduleDate, displayedComponents: .date) {
                                Text("Schedule Date: ")
                            }
                            
                            HStack {
                                Text("Child:")
                                    .padding(.trailing, 10)
                                Spacer()
                                NavigationLink {
                                    SelectOptionView(viewModel: .init(options: self.viewModel.childrenOptions), delegate: self)
                                } label: {
                                    HStack {
                                        Spacer()
                                        Text(childText)
                                        Image("right_arrow")
                                    }
                                    .padding(.vertical, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.black, lineWidth: 1)
                                    )
                                }
                            }
                            
                            HStack {
                                Text("Activity:")
                                    .padding(.trailing, 10)
                                Spacer()
                                NavigationLink {
                                    SelectOptionView(viewModel: .init(type: .multi, options: self.viewModel.activityOptions), delegate: self)
                                } label: {
                                    HStack {
                                        Spacer()
                                        Text(activityText)
                                        Image("right_arrow")
                                    }
                                    .padding(.vertical, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.black, lineWidth: 1)
                                    )
                                }
                            }
                            
                            Button() {
                                self.viewModel.model.date = self.scheduleDate
                                self.viewModel.model.child = self.selectedChild
                                self.viewModel.model.activities = [self.selectedActivity]
                                
                                switch self.viewModel.mode {
                                case .add:
                                    self.viewModel.delegate?.addSchedule(schedule: self.viewModel.model)
                                case .edit:
                                    self.viewModel.delegate?.editSchedule(schedule: self.viewModel.model)
                                }
                                
                                dismiss()
                            } label: {
                                Text(self.viewModel.title)
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.system(size: 22))
                                    .padding()
                            }
                            .buttonStyle(.plain)
                            .padding(10)
                            .background(.green)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 60.0)
                            .cornerRadius(12)
                            .padding(.top, 5)
                        }
                        Spacer()
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .navigationTitle(self.viewModel.submitText)
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding(.horizontal, 20)
    }
}

extension ScheduleFormView: SelectOptionProtocol {
    
    func apply(options: [SelectOption]) {
        
    }
}

struct ScheduleFormView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleFormView(viewModel: .init())
    }
}
