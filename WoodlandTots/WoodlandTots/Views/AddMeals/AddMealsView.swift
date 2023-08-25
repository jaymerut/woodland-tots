//
//  AddMealsView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 8/24/23.
//

import SwiftUI

struct AddMealsView: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    
    @State private var scheduleDate = Date.now
    @State private var selectedChild: ChildItem = .init()
    @State private var childText: String = "No child selected"
    
    @State private var mealOptions = [SelectOption]()
    
    @State private var selectedMeal: MealType = .breakfast
    @State private var note: String = ""
    
    var body: some View {
        return NavigationStack() {
            VStack(alignment: .leading) {
                
                ScrollView() {
                    HStack {
                        VStack {
                            
                            HStack {
                                Text("Meal:")
                                    .padding(.trailing, 10)
                                Spacer()
                                NavigationLink {
                                    SelectOptionView<MealType>(viewModel: .init(options: mealOptions, valueType: MealType.self), delegate: self).onAppear {
                                        mealOptions = self.getMealOptions()
                                    }
                                } label: {
                                    HStack {
                                        Spacer()
                                        Text(selectedMeal.rawValue)
                                        Image("right_arrow")
                                    }
                                    .padding(.vertical, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.black, lineWidth: 1)
                                    )
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
                                
                                dismiss()
                            } label: {
                                Text("Save and Add")
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
            .navigationTitle("Add Meal")
            .navigationBarTitleDisplayMode(.inline)
        }
        .padding(.horizontal, 20)
    }
    
    private func getMealOptions() -> [SelectOption] {
        return [
            .init(name: MealType.breakfast.rawValue, value: MealType.breakfast, isSelected: MealType.breakfast == self.selectedMeal),
            .init(name: MealType.snackAM.rawValue, value: MealType.snackAM, isSelected: MealType.snackAM == self.selectedMeal),
            .init(name: MealType.lunch.rawValue, value: MealType.lunch, isSelected: MealType.lunch == self.selectedMeal),
            .init(name: MealType.snackPM.rawValue, value: MealType.snackPM, isSelected: MealType.snackPM == self.selectedMeal),
            .init(name: MealType.snackLate.rawValue, value: MealType.snackLate, isSelected: MealType.snackLate == self.selectedMeal),
            .init(name: MealType.dinner.rawValue, value: MealType.dinner, isSelected: MealType.dinner == self.selectedMeal)
        ]
    }
}

extension AddMealsView: SelectOptionProtocol {
    
    func apply<T>(options: [SelectOption], valueType: T.Type) {
        if valueType is MealType.Type {
            if let child = options.first, let item = child.value as? MealType {
                self.selectedMeal = item
            }
        }
    }
}

struct AddMealsView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleFormView(viewModel: .init())
    }
}
