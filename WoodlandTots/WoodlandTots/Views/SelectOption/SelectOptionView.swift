//
//  SelectOptionView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/26/23.
//

import SwiftUI

struct SelectOptionView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    
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
                        Text("APPLY")
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
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                
            }
            .navigationTitle("Select an Option")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func apply(options: [SelectOption]) {
        dismiss()
    }
}

extension SelectOptionView: SelectOptionProtocol {
    func selectedOption(option: SelectOption) {
        option.isSelected.toggle()
        
        if viewModel.type == .single {
            self.apply(options: [option])
        }
    }
}

struct SelectOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectOptionView(viewModel: .init(type: .single, options: self.createTestModelArray()))
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
