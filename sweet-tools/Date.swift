//
//  DateComponents.swift
//  sweet-tools
//
//  Created by swieeft on 2018. 6. 7..
//  Copyright © 2018년 swieeft. All rights reserved.
//

import Foundation

extension Date {
    public func createCalendar() -> [[Int]] {
        
        var calendarArr:[[Int]] = [[Int]](repeating: Array(repeating: -1,count: 7 ), count: 6)
        
        let calendar = Calendar(identifier: .gregorian)
        let date = calendar.dateComponents([.year, .month], from: self)
        
        var lastDay:Int = 0
    
        switch date.month! {
        case 1, 3, 5, 7, 8, 10, 12:
            lastDay = 31
        case 4, 6, 9, 11:
            lastDay = 30
        default:
            if  date.year! % 400 == 0 || date.year! % 4 == 0 && date.year! % 100 != 0 {
                lastDay = 29
            } else {
                lastDay = 28
            }
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let startDate = formatter.date(from: "\(date.year!)-\(date.month!)-\(1)")
        let endDate = formatter.date(from: "\(date.year!)-\(date.month!)-\(lastDay)")
        
        if startDate != nil && endDate != nil {
            let calendar = Calendar(identifier: .gregorian)
            
            let startDateWeek = calendar.dateComponents([.weekOfMonth, .weekday], from: startDate!)
            let endDateWeek = calendar.dateComponents([.weekOfMonth, .weekday], from: endDate!)
            
            let startDateWeekOfMonth = startDateWeek.weekOfMonth! - 1
            let startDateWeekDay = startDateWeek.weekday! - 1
            let endDateWeekOfMonth = endDateWeek.weekOfMonth! - 1
            let endDateWeekDay = endDateWeek.weekday! - 1
            
            var day:Int = 1
            
            for weekOfMonth in 0..<6 {
                if weekOfMonth < startDateWeekOfMonth || weekOfMonth > endDateWeekOfMonth {
                    continue
                }
                
                for weekDay in 0..<7 {
                    if weekDay < startDateWeekDay && weekOfMonth == startDateWeekOfMonth {
                        continue
                    } else if weekDay > endDateWeekDay && weekOfMonth == endDateWeekOfMonth {
                        continue
                    } else {
                        calendarArr[weekOfMonth][weekDay] = day
                        day += 1
                    }
                }
            }
        }
        
        return calendarArr
    }
}
