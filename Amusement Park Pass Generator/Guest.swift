//
//  Guest.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 7/7/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation

// Starter class for polymorphism

class Person {}

class Guest: Person, GuestEntrant {
    
    var type: GuestType
    var profile: PersonalInfo?
    
    init(type: GuestType, profile: PersonalInfo?) throws {
        self.type = type
        self.profile = profile
        
        if type == .freeChild {
            
            // This logic checks to make sure A: The DoB isn't empty, and B: the child is under 5 years old.
            
            if let confirmedDob = profile?.dateOfBirth {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM-dd-yyyy"
                
                let typeDate = dateFormatter.date(from: confirmedDob)
                let yearsAlive = Double((typeDate?.timeIntervalSinceNow)!) / 31636000 // Converting Seconds to Years!
                
                if yearsAlive <= -5 {
//                    print("You are too old for the free child admission status.")
                    throw InputError.tooOld
                } else {
                    print("Welcome free child!")
                }
            } else {
//                print("You must provide your date of birth to be a child entrant.")
                throw InputError.missingDateOfBirth
            }
        }
    }
    
    var discountAccess: [DiscountAccess]? {
        var discountHolder: [DiscountAccess]?
        
        
        switch type {
        case .classic, .freeChild:
            discountHolder =  nil
        case .vip:
            discountHolder = [.foodDiscount10, .merchDiscount20]
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
            
            if let confirmedDiscounts = discountAccess {
                if confirmedDiscounts.contains(access) {
                    print("Discount of \(access) granted.")
                } else {
                    print("Discount Denied. You have the following discounts: \(confirmedDiscounts[0]) and \(confirmedDiscounts[1])")
                }
            } else {
                print("Discount Denied. You have no discounts.")
            }
        }
    }
}

