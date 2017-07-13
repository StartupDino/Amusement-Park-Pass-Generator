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
            //FIX: remove the print statement for part 2
            print("Error! Missing first name")
            throw InputError.missingInput(required: "First Name")
        }
        
        guard profile.lastName != nil && profile.lastName != "" else {
            //FIX: remove the print statement for part 2
            print("Error! Missing last name!")
            throw InputError.missingInput(required: "Last Name")
        }
        
        guard profile.streetAddress != nil && profile.streetAddress != "" else {
            //FIX: remove the print statement for part 2
            print("Error! Missing Address!")
            throw InputError.missingInput(required: "Street Address")
        }
        guard profile.city != nil && profile.city != "" else {
            //FIX: remove the print statement for part 2
            print("Error! Missing city!")
            throw InputError.missingInput(required: "City")
        }
        guard profile.state != nil && profile.state != "" else {
            //FIX: remove the print statement for part 2
            print("Error! Missing state!")
            throw InputError.missingInput(required: "State")
        }
        
        self.type = type
        self.profile = profile
    }
    
    var discountAccess: [DiscountAccess] {
        var discountHolder: [DiscountAccess]
        
        switch type {
        case .foodService, .maintenance, .rideService:
            discountHolder = [.foodDiscount(25), .merchDiscount(25)]
        case .manager:
            discountHolder = [.foodDiscount(25), .merchDiscount(25)]
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
            
            let discountArray: [Int] = [(discountAccess[0].discount), (discountAccess[1].discount)]
            
            if discountArray.contains(access.discount) {
                print("Discount of \(access.discount)% granted.")
            } else {
                print("Discount denied. Your discounts are \(discountAccess[0].discount)% on food and \(discountAccess[1].discount)% on merchandise.")
            }
        }
        
    }
}
