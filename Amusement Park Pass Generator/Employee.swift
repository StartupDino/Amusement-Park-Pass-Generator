//
//  Employee.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 6/30/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation

class Employee: EmployeeEntrant {
    
    var type: EmployeeType
    var profile: PersonalInfo
    var rideAccess: [RideAccess] = [.allRides]
    
    init(type: EmployeeType, profile: PersonalInfo) {
        self.type = type
        self.profile = profile
    }
    
    var discount: [DiscountAccess] {
        var whichDiscount: [DiscountAccess]
        
        switch type {
        case .foodService, .rideService, .maintenance:
            whichDiscount = [.foodDiscount(amount: 15), .merchDiscount(amount: 25)]
        case .manager:
            whichDiscount = [.foodDiscount(amount: 25), .merchDiscount(amount: 25)]
        }
        return whichDiscount
    }
    
    var areaAccess: [AreaAccess] {
        var whichAreas: [AreaAccess]
        
        switch type {
        case .foodService:
            whichAreas = [.amusement, .kitchen]
        case .rideService:
            whichAreas = [.amusement, .rideControl]
        case .maintenance:
            whichAreas = [.amusement, .kitchen, .rideControl, .maintenance]
        case .manager:
            whichAreas = [.amusement, .kitchen, .rideControl, .maintenance, .office]
        }
        return whichAreas
    }
}
