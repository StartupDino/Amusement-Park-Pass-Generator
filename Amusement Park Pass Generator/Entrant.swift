//
//  Entrant.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 6/30/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation

// SETTING UP HIGH LEVEL CASES FOR ACCESS AND DISCOUNTS

enum AreaAccess {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
}

enum RideAccess {
    case allRides
    case skipLines
}

enum DiscountAccess {
    case foodDiscount(amount: Int)
    case merchDiscount(amount: Int)
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
    var discount: [DiscountAccess]? { get }
}

protocol EmployeeEntrant: Entrant {
    var type: EmployeeType { get set }
    var profile: PersonalInfo { get set }
    var discount: [DiscountAccess] { get }
}

// A STRUCT CONTAINING ALL PERSONAL INFORMATION, with errors for missing fields

struct PersonalInfo {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zip: Int
    var dateOfBirth: String?
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zip: Int, dateOfBirth: String?) throws {
        
        
        if firstName.isEmpty {
            throw InputError.missingInput(required: "First name can't be empty")
        } else if lastName.isEmpty {
            throw InputError.missingInput(required: "Last name can't be empty")
        } else if streetAddress.isEmpty {
            throw InputError.missingInput(required: "Street Address can't be empty")
        } else if city.isEmpty {
            throw InputError.missingInput(required: "City can't be empty")
        } else if state.isEmpty {
            throw InputError.missingInput(required: "State can't be empty")
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zip = zip
        self.dateOfBirth = dateOfBirth
    }
}



