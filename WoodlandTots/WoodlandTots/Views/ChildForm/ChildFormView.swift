//
//  ChildFormView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct ChildFormView: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var note: String = ""
    @State private var selectedAgeType: String = ""
    
    var body: some View {
        return NavigationStack() {
            VStack(alignment: .leading) {
                
                ScrollView() {
                    HStack {
                        VStack {
                            Text("Name:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("Enter name", text: $name)
                                .textFieldStyle(.plain)
                                .padding(10)
                                .padding(.leading, 4)
                                .accentColor(.black)
                                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                                .padding(.top, -5)
                                .onAppear() {
                                    self.name = self.viewModel.model.name
                                }
                            
                            Text("Age:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 10)
                            ZStack(alignment: .trailing) {
                                TextField("Enter age", text: $age)
                                    .textFieldStyle(.plain)
                                    .keyboardType(.numberPad)
                                    .padding(10)
                                    .padding(.leading, 4)
                                    .accentColor(.black)
                                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                                    .padding(.top, -5)
                                    .onAppear() {
                                        self.age = self.viewModel.model.age > 0 ? String(self.viewModel.model.age) : ""
                                    }
                                Picker("Please choose an age type", selection: $selectedAgeType) {
                                    ForEach(viewModel.ageTypes, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .onAppear() {
                                    self.selectedAgeType = self.viewModel.model.ageUnits.rawValue
                                }
                                
                            }
                                                        
                            Text("Note:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 10)
                            TextEditor(text: $note)
                                .textFieldStyle(.plain)
                                .padding(10)
                                .padding(.leading, 4)
                                .accentColor(.black)
                                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                                .padding(.top, -5)
                                .frame(minHeight: 200)
                                .onAppear() {
                                    self.note = self.viewModel.model.note
                                }
                            
                            Button() {
                                self.viewModel.model.name = $name.wrappedValue
                                self.viewModel.model.age = Int($age.wrappedValue) ?? 0
                                self.viewModel.model.ageUnits = AgeType(rawValue: $selectedAgeType.wrappedValue) ?? .months
                                self.viewModel.model.note = $note.wrappedValue
                                
                                switch self.viewModel.mode {
                                case .add:
                                    self.viewModel.delegate?.addChild(child: self.viewModel.model)
                                case .edit:
                                    self.viewModel.delegate?.editChild(child: self.viewModel.model)
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
        }
        .padding(.horizontal, 20)
    }
}

struct ChildFormView_Previews: PreviewProvider {
    static var previews: some View {
        ChildFormView(viewModel: .init())
    }
}

