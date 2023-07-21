//
//  AddChildView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct AddChildView: View {

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
                            
                            Text("Age:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 10)
                            ZStack(alignment: .trailing) {
                                TextField("Enter Age", text: $age)
                                    .textFieldStyle(.plain)
                                    .keyboardType(.numberPad)
                                    .padding(10)
                                    .padding(.leading, 4)
                                    .accentColor(.black)
                                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                                    .padding(.top, -5)
                                Picker("Please choose an age type", selection: $selectedAgeType) {
                                    ForEach(viewModel.ageTypes, id: \.self) {
                                        Text($0)
                                    }
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
                            
                            Button() {
                                self.viewModel.delegate?.addChild(child: ChildItem(
                                    id: UUID.init().uuidString,
                                    name: $name.wrappedValue,
                                    age: Int($age.wrappedValue) ?? 0,
                                    ageUnits: AgeType(rawValue: $selectedAgeType.wrappedValue) ?? .months,
                                    note: $note.wrappedValue
                                ))
                                dismiss()
                            } label: {
                                Text("Add Child")
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
            .navigationTitle("Add Child")
        }
        .padding(.horizontal, 20)
    }
}

struct AddChildView_Previews: PreviewProvider {
    static var previews: some View {
        AddChildView(viewModel: .init())
    }
}

