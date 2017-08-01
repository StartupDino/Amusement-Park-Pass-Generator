//
//  Vendor.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 7/31/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation


class Vendor: Person, VendorEntrant {
    
    var companyName: String
    var dateOfVisit: String
    var profile: PersonalInfo
    var rideAccess: [RideAccess] = [.allRides]
    var areaAccess: [AreaAccess] = [.amusement, .kitchen]
    
    init(profile: PersonalInfo, dateOfVisit: String, companyName: String) throws {
        
        guard profile.firstName != nil && profile.firstName != "" else {
            throw InputError.missingFirstName
        }
        
        guard profile.lastName != nil && profile.lastName != "" else {
            throw InputError.missingLastName
        }
        
        guard profile.dateOfBirth != nil && profile.dateOfBirth != "" else {
            throw InputError.missingDateOfBirth
        }
        
        self.profile = profile
        self.companyName = companyName
        self.dateOfVisit = dateOfVisit
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
        
        if access is DiscountAccess {
            print("access denied. You have no discounts available.")
        }
    }
}



