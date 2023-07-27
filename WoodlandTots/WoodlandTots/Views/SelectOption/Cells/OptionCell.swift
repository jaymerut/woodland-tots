//
//  OptionCell.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/26/23.
//

import SwiftUI

struct OptionCell: View {
    @ObservedObject var item: SelectOption
    var delegate: SelectOptionProtocol
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.name)
            }
        }
        .onTapGesture {
            delegate.selectedOption(option: item)
        }
        .padding(10)
    }
}

struct OptionCell_Previews: PreviewProvider {
    static var previews: some View {
        OptionCell(item: .init(name: "test", value: "me"), delegate: SelectOptionView(viewModel: .init(options: .init())))
    }
}
