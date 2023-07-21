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
                            SwipeView {
                                ActivityCell(item: item)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                            } leadingActions: { _ in
                            } trailingActions: { _ in
                                SwipeAction(systemImage: "square.and.pencil", backgroundColor: .green) {
                                    // TODO: Navigate user to Edit view
                                }
                                .allowSwipeToTrigger(false)
                                .foregroundColor(.white)
                                
                                SwipeAction(systemImage: "trash.fill", backgroundColor: .red) {
                                    
                                    if let index = self.viewModel.activities.firstIndex(where: { $0.id == item.id }) {
                                        self.viewModel.activities.remove(at: Int(index.description)!)
                                        SwiftAppDefaults.add(.activityModels, self.viewModel.convertActivityItemToActivityModels(models: self.viewModel.activities))
                                    }
                                    
                                }
                                .allowSwipeToTrigger(false)
                                .foregroundColor(.white)
                                
                            }
                        }
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
    }
}

extension ActivitiesView: ActivityFormProtocol {

    func addActivity(activity: ActivityItem) {
        self.viewModel.activities.append(activity)
        SwiftAppDefaults.add(.activityModels, self.viewModel.convertActivityItemToActivityModels(models: self.viewModel.activities))
    }
    
    func editActivity(activity: ActivityItem) {
        // TODO: Implement
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

