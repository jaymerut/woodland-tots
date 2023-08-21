//
//  ScheduleViewProtocol.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 8/20/23.
//

import Foundation

protocol ScheduleViewProtocol {
    func getSchedules(date: Date) -> [ScheduleItem]
}
