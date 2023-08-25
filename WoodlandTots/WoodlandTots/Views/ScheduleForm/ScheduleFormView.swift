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
    @State private var childText: String = "No child selected"
    
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
                                    SelectOptionView<ChildItem>(viewModel: .init(options: self.viewModel.childrenOptions, valueType: ChildItem.self), delegate: self)
                                } label: {
                                    HStack {
                                        Spacer()
                                        Text(childText)
                                        .onAppear() {
                                            if !self.viewModel.model.child.name.isEmpty {
                                                self.childText = self.viewModel.model.child.name
                                            }
                                        }
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
            .onAppear() {
                self.viewModel.updateViewModel()
            }
            .navigationTitle(self.viewModel.submitText)
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding(.horizontal, 20)
    }
}

extension ScheduleFormView: SelectOptionProtocol {
    
    func apply<T>(options: [SelectOption], valueType: T.Type) {
        if valueType is ChildItem.Type {
            if let child = options.first, let item = child.value as? ChildItem {
                self.selectedChild = item
                self.viewModel.model.child = item
                
                self.childText = child.name
            }
        }
    }
}

struct ScheduleFormView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleFormView(viewModel: .init())
    }
}
