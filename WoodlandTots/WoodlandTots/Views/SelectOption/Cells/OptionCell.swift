//
//  OptionCell.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/26/23.
//

import SwiftUI

struct OptionCell: View {
    @ObservedObject var item: SelectOption
    var delegate: OptionCellProtocol
    private let unselectedRadioImage = Image("radio_unselected")
    private let selectedRadioImage = Image("radio_selected")
    
    @State private var radioImage = Image("radio_unselected")
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.name)
                Spacer()
                radioImage
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            delegate.selectedOption(option: item)
            self.setRadioImage()
        }
        .frame(height: 40)
        .padding(10)
        .onAppear(){
            self.setRadioImage()
        }
    }
    
    private func setRadioImage() {
        if (item.isSelected) {
            radioImage = selectedRadioImage
        } else {
            radioImage = unselectedRadioImage
        }
    }
}

struct OptionCell_Previews: PreviewProvider {
    static var previews: some View {
        OptionCell(item: .init(name: "test", value: "me"), delegate: SelectOptionView<String>(viewModel: .init(options: .init(), valueType: String.self), delegate: ScheduleFormView(viewModel: .init())))
    }
}
