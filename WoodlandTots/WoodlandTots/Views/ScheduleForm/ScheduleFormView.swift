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
                                Spacer()
                                Picker("Please choose a child", selection: $selectedChild) {
                                    ForEach(viewModel.children) {
                                        Text($0.name)
                                    }
                                }
                                
                            }
                            
                            HStack {
                                Text("Activity:")
                                Spacer()
                                Picker("Please choose an activity", selection: $selectedActivity) {
                                    ForEach(viewModel.activities) {
                                        Text($0.name)
                                    }
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

struct ScheduleFormView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleFormView(viewModel: .init())
    }
}
