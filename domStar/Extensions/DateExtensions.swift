//
//  DateExtensions.swift
//  domStar
//
//  Created by Dominick Hera on 6/12/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import Foundation

extension Date {
    func isBetween(_ startDate: Date, _ endDate: Date) -> Bool {
        return (startDate.compare(self) == .orderedAscending) && (endDate.compare(self) == .orderedDescending)
    }
}
