//
//  ScheduleFormProtocol.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/21/23.
//

import Foundation

protocol ScheduleFormProtocol {
    func addSchedule(schedule: ScheduleItem)
    func editSchedule(schedule: ScheduleItem)
    func removeSchedule(schedule: ScheduleItem)
}
