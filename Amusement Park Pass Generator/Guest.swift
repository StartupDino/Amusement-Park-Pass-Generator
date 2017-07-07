//
//  Guest.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 7/7/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation

// LET'S TRY TO CREATE A GUEST

class Guest: GuestEntrant {
    
    var type: GuestType
    var profile: PersonalInfo?
    
    init(type: GuestType, profile: PersonalInfo?) throws {
        self.type = type
        self.profile = profile
        
        if type == .freeChild {
            guard profile?.dateOfBirth != nil else {
                throw InputError.missingInput(required: "Date of Birth can't be empty!")
            }
        }
    }
    
    var discount: [DiscountAccess]? {
        var discountHolder: [DiscountAccess]?
        
        switch type {
        case .classic, .freeChild:
            discountHolder = nil
        case .vip:
            discountHolder = [.foodDiscount(amount: 10), .merchDiscount(amount: 20)]
        }
        return discountHolder
    }
    
    var areaAccess: [AreaAccess] {
        var whichAreas: [AreaAccess]
        
        switch type {
        case .classic, .freeChild, .vip:
            whichAreas = [.amusement]
        }
        return whichAreas
    }
    
    var rideAccess: [RideAccess] {
        var whichRides: [RideAccess]
        
        switch type {
        case .classic, .freeChild:
            whichRides = [.allRides]
        case .vip:
            whichRides = [.allRides, .skipLines]
        }
        return whichRides
    }
}
