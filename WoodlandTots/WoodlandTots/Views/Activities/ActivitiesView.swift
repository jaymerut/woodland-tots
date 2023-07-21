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
        return NavigationView() {
            VStack() {
                List {
                    ForEach(viewModel.activities) { item in
                        ActivityCell(item: item, delegate: self)
                            .listRowInsets(.init(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top, 10)
            }
            .navigationTitle("Activities")
            .toolbar {
                NavigationLink {
                    ActivityFormView(viewModel: .init(delegate: self, mode: .add))
                } label: {
                    Image(systemName: "plus")
                        .renderingMode(.template)
                        .frame(width: 45, height: 45)
                        .foregroundColor(.white)
                        .background(Color.init(hex: 0x097969))
                        .clipShape(Circle())
                }
                .buttonStyle(.automatic)
            }
        }
    }
}

extension ActivitiesView: ActivityFormProtocol {

    func addActivity(activity: ActivityItem) {
        self.viewModel.activities.append(activity)
        SwiftAppDefaults.add(.activityModels, self.viewModel.convertActivityItemToActivityModels(models: self.viewModel.activities))
    }
    
    func editActivity(activity: ActivityItem) {
        if let row = self.viewModel.activities.firstIndex(where: { $0.id == activity.id }) {
            self.viewModel.activities.insert(activity, at: row)
            self.viewModel.activities.remove(at: row)
            
            SwiftAppDefaults.add(.activityModels, self.viewModel.convertActivityItemToActivityModels(models: self.viewModel.activities))
        }
    }
    
    func removeActivity(activity: ActivityItem) {
        if let row = self.viewModel.activities.firstIndex(where: { $0.id == activity.id }) {
            self.viewModel.activities.remove(at: row)
            SwiftAppDefaults.add(.activityModels, self.viewModel.convertActivityItemToActivityModels(models: self.viewModel.activities))
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(viewModel: self.getViewModel())
    }
    
    static func getViewModel() -> ActivitiesView.ViewModel {
        let viewModel = ActivitiesView.ViewModel.init()
        viewModel.activities = [.init(id: "123", name: "Test", categoryType: .art, description: "Test Me")]
        
        return viewModel
    }
}

