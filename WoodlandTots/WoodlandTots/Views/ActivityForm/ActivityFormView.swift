//
//  ActivityFormView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/20/23.
//

import SwiftUI

struct ActivityFormView: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    @State private var name: String = ""
    @State private var selectedCategory: String = ""
    @State private var description: String = ""
    
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
                            
                            HStack {
                                Text("Category:")
                                    .padding(.trailing, -10)
                                
                                Picker("Please choose a category", selection: $selectedCategory) {
                                    ForEach(viewModel.categories, id: \.self) {
                                        Text($0)
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding(.top, 10)
                            
                                                        
                            Text("Description:")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 10)
                            TextEditor(text: $description)
                                .textFieldStyle(.plain)
                                .padding(10)
                                .padding(.leading, 4)
                                .accentColor(.black)
                                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                                .padding(.top, -5)
                                .frame(minHeight: 200)
                            
                            Button() {
                                let activity = ActivityItem(
                                    id: UUID.init().uuidString,
                                    name: $name.wrappedValue,
                                    categoryType: CategoryType(rawValue: $selectedCategory.wrappedValue) ?? .empty,
                                    description: $description.wrappedValue
                                )
                                
                                switch self.viewModel.mode {
                                case .add:
                                    self.viewModel.delegate?.addActivity(activity: activity)
                                case .edit:
                                    self.viewModel.delegate?.editActivity(activity: activity)
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

struct ActivityFormView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityFormView(viewModel: .init())
    }
}
