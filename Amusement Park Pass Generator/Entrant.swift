//
//  Entrant.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 6/30/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation

// SETTING UP HIGH LEVEL CASES FOR ACCESS AND DISCOUNTS

protocol Access {}

enum AreaAccess: Access {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
}

enum RideAccess: Access {
    case allRides
    case skipLines
}

enum DiscountAccess: Access {
    case foodDiscount(Int)
    case merchDiscount(Int)
}

extension DiscountAccess {
    
    var discount: Int {
        switch self {
        case .foodDiscount(let amt):
            return amt
        case .merchDiscount(let amt):
            return amt
        }
    }
}

// SETTING UP HIGH LEVEL TYPES OF GUESTS AND EMPLOYEES

enum GuestType {
    case classic
    case vip
    case freeChild
}

enum EmployeeType {
    case foodService
    case rideService
    case maintenance
    case manager
}

// SETTING GUEST AND EMPLOYEE REQUIREMENTS

protocol Entrant {
    var areaAccess: [AreaAccess]  { get }
    var rideAccess: [RideAccess] { get }
}

protocol GuestEntrant: Entrant {
    var type: GuestType { get set }
    var profile: PersonalInfo? { get set }
    var discountAccess: [DiscountAccess]? { get }
}

protocol EmployeeEntrant: Entrant {
    var type: EmployeeType { get set }
    var profile: PersonalInfo { get set }
    var discountAccess: [DiscountAccess] { get }
}

// A STRUCT CONTAINING ALL PERSONAL INFORMATION, with errors for missing fields

struct PersonalInfo {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zip: Int?
    var dateOfBirth: String?
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zip: Int?, dateOfBirth: String?) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zip = zip
        self.dateOfBirth = dateOfBirth
    }
}



