//
//  SelectOptionView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/26/23.
//

import SwiftUI

struct SelectOptionView<T>: View {
    
    @Environment(\.dismiss) private var dismiss
    var viewModel: ViewModel
    var delegate: SelectOptionProtocol
    
    @State private var isSingleSelect = false
    @State private var isApplied = false
    
    var body: some View {
        return NavigationView() {
            ZStack {
                VStack {
                    List {
                        ForEach(viewModel.options) { item in
                            OptionCell(item: item, delegate: self)
                                .listRowInsets(.init(top: 5, leading: 5, bottom: 5, trailing: 5))
                                .buttonStyle(PlainButtonStyle())
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .padding(.top, 10)
                    .padding(.bottom, 65)
                }
                VStack {
                    Spacer()
                    Button() {
                        self.apply(options: self.viewModel.options.filter( {$0.isSelected} ))
                    } label: {
                        Text("Apply")
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
                    .onAppear() {
                        if self.viewModel.type == .single {
                            self.isSingleSelect = true
                        }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                .opacity(self.isSingleSelect ? 0 : 1)
                
            }
            .navigationTitle("Select an Option")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear() {
            if !self.isApplied {
                self.viewModel.options = self.viewModel.oldOptions
                for option in self.viewModel.options {
                    option.isSelected = false
                }
            }
        }
        .onDisappear() {
            if !self.isApplied {
                self.viewModel.options = self.viewModel.oldOptions
                for option in self.viewModel.options {
                    option.isSelected = false
                }
            }
        }
    }
    
    private func apply(options: [SelectOption]) {
        self.delegate.apply(options: options, valueType: T.self)
        self.isApplied = true
        dismiss()
    }
}

extension SelectOptionView: OptionCellProtocol {
    func selectedOption(option: SelectOption) {
        option.isSelected.toggle()
        
        if viewModel.type == .single {
            for vmOption in self.viewModel.options {
                if vmOption.id != option.id {
                    vmOption.isSelected = false
                }
            }
            self.apply(options: [option])
        }
    }
}

struct SelectOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectOptionView<String>(viewModel: SelectOptionView.ViewModel.init(type: .multi, options: self.createTestModelArray(), valueType: String.self), delegate: ScheduleFormView(viewModel: .init()))
    }
    private static func createTestModelArray() -> [SelectOption] {
        var array = [SelectOption]()
        for index in 1...20 {
            array.append(self.createTestModel(index: index))
        }
        return array
    }
    private static func createTestModel(index: Int) -> SelectOption {
        return .init(name: "Test \(index)", value: index)
    }
}
