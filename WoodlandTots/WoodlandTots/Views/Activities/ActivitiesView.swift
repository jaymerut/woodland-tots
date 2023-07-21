//
//  ActivitiesView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import SwiftUI

struct ActivitiesView: View {

    @State private var selection: String? = nil
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        return NavigationStack() {
            VStack() {
                
                List {
                    ForEach(viewModel.activities) { item in
                        Section {
                            ActivityCell(item: item)
                                .listRowInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                                .listRowSeparator(.hidden)
                                .background(.blue)
                        }
                        .cornerRadius(8)
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top, 10)
            }
            .navigationTitle("Activities")
            .toolbar {
                NavigationLink {
                    AddActivityView(viewModel: .init(delegate: self))
                } label: {
                    Image("add")
                        .renderingMode(.template)
                        .foregroundColor(.init(hex: 0x097969))
                }
                .buttonStyle(.automatic)
                
            }
        }
        .padding(.horizontal, 20)
    }
}

extension ActivitiesView: AddActivityProtocol {
    func addedActivity(activity: ActivityItem) {
        self.viewModel.activities.append(activity)
        SwiftAppDefaults.add(.activityModels, self.viewModel.convertActivityItemToActivityModels(models: self.viewModel.activities))
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(viewModel: .init())
    }
}

