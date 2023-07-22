//
//  ScheduleView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct ScheduleView: View {

    @State private var selection: String? = nil
    @ObservedObject var viewModel: ViewModel
    
    @Environment(\.calendar) var calendar

    private var year: DateInterval {
        calendar.dateInterval(of: .year, for: Date())!
    }
    
    var body: some View {
        return NavigationStack() {
                VStack {
                    HStack() {
                        CalendarView(interval: year) { date in
                                Text("30")
                                    .hidden()
                                    .padding(8)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .padding(.vertical, 4)
                                    .overlay(
                                        ZStack {
                                            VStack {
                                                Text(String(self.calendar.component(.day, from: date)))
                                                    .fontWeight(.bold)
                                            }
                                            VStack {
                                                HStack {
                                                    Spacer()
                                                    VStack { }
                                                        .frame(width: 3, height: 3)
                                                        .background(.black)
                                                        .clipShape(Circle())
                                                }
                                                .padding(.horizontal, 4)
                                                Spacer()
                                            }
                                            .padding(.vertical, 8)
                                        }
                                        
                                    )
                        }
                    }
                }
                
            
            .navigationTitle("Schedule")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    
                } label: {
                    Image(systemName: "plus")
                        .renderingMode(.template)
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                        .background(Color.init(hex: 0x097969))
                        .clipShape(Circle())
                }
                .buttonStyle(.automatic)
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(viewModel: .init())
    }
}
