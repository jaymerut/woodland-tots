//
//  ActivityCell.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import SwiftUI

struct ActivityCell: View {
    @ObservedObject var item: ActivityItem
    var delegate: ActivityFormProtocol
    
    @State private var isPresentingForm = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(item.name)
                        .font(FontHelper.fontHelveticaBold(22))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .trailing) {
                        HStack {
                            Button() {
                                isPresentingForm.toggle()
                            } label: {
                                Image(systemName: "square.and.pencil")
                                    .renderingMode(.template)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                    .background(.green)
                                    .clipShape(Circle())
                            }
                            .buttonStyle(.plain)
                            
                            
                            NavigationLink(destination: ActivityFormView(viewModel: .init(model: item, delegate: self.delegate, mode: .edit)), isActive: $isPresentingForm) {}
                                    .frame(width: 0, height: 0)
                                    .hidden()
            
                            Image(systemName: "trash.fill")
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .background(.red)
                                .clipShape(Circle())
                                .onTapGesture {
                                    self.delegate.removeActivity(activity: item)
                                }
                        }
                    }
                }
                
                Text(item.categoryType.rawValue)
                    .font(FontHelper.fontHelveticaBold(14))
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(item.description)
                    .font(FontHelper.fontHelveticaNeueItalic(16.0))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                    .visibility(item.description.isEmpty ? .gone : .visible)
            }
            .padding(10)
        }
    }
        
}

struct ActivityCell_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCell(item: .init(
            id: UUID.init().uuidString,
            name: "Test 1",
            categoryType: .language,
            description: "Description"
        ), delegate: ActivitiesView(viewModel: .init()))
    }
}
