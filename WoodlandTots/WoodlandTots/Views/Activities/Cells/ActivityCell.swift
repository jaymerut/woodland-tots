//
//  ActivityCell.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import SwiftUI

struct ActivityCell: View {
    @ObservedObject var item: ActivityItem
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack() {
                    Text(item.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(15)
        }
        
    }
}

struct ActivityCell_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCell(item: .init(
            id: UUID.init().uuidString,
            name: "Test 1",
            categoryType: .art,
            description: "Desc"
        ))
    }
}
