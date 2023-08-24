//
//  ChildSummaryView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 8/20/23.
//

import SwiftUI

struct ChildSummaryView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.schedule.child.name)
                .font(FontHelper.fontHelveticaBold(36))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Activities")
                .font(FontHelper.fontHelvetica(24))
                .foregroundColor(.blue)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            ForEach(viewModel.schedule.activities) { item in
                Text(item.categoryType.rawValue)
                    .font(FontHelper.fontHelveticaBold(18))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                Text(item.description)
                    .font(FontHelper.fontHelvetica(14))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 1)
            }
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
    }
}

struct ChildSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ChildSummaryView(viewModel: .init(schedule: .init(id: UUID().uuidString, date: .now, child: .init(id: UUID().uuidString, name: "Test Child", age: 5, ageUnits: .years, note: ""), activities: [.init(id: UUID().uuidString, name: "Test Activity", categoryType: .art, description: "Learned how to count to 10.")])))
    }
}
