//
//  Employee.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 6/30/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation

class Employee: Person, EmployeeEntrant {
    
    var type: EmployeeType
    var profile: PersonalInfo
    var rideAccess: [RideAccess] = [.allRides]
        
    init(type: EmployeeType, profile: PersonalInfo) throws {
        
        guard profile.firstName != nil && profile.firstName != "" else {
            throw InputError.missingFirstName
        }
        
        guard profile.lastName != nil && profile.lastName != "" else {
            throw InputError.missingLastName
        }
        
        guard profile.streetAddress != nil && profile.streetAddress != "" else {
            throw InputError.missingAddress
        }
        guard profile.city != nil && profile.city != "" else {
            throw InputError.missingCity
        }
        guard profile.state != nil && profile.state != "" else {
            throw InputError.missingState
        }
        
        guard profile.zip != nil else {
            throw InputError.missingZip
        }
        
        self.type = type
        self.profile = profile
    }
    
    var discountAccess: [DiscountAccess] {
        var discountHolder: [DiscountAccess]
        
        switch type {
        case .foodService, .maintenance, .rideService:
            discountHolder = [.foodDiscount15, .merchDiscount25]
        case .manager:
            discountHolder = [.foodDiscount25, .merchDiscount25]
        }
        return discountHolder
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
    
    func checkAccess(access: Access) {
        
        if let access = access as? AreaAccess {
            if areaAccess.contains(access) {
                print("access granted")
            } else {
                print("access denied")
            }
        }
        
        if let access = access as? RideAccess {
            if rideAccess.contains(access) {
                print("access granted")
            } else {
                print("access denied")
            }
        }
        
        if let access = access as? DiscountAccess {
            
            if discountAccess.contains(access) {
                print("Discount of \(access) granted.")
            } else {
                print("Discount Denied. You have discounts of \(discountAccess[0]) and \(discountAccess[1])")
            }
        }
    }
}
