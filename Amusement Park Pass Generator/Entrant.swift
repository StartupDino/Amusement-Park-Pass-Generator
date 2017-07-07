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
    var dateOfBirth: Date?
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zip: Int, dateOfBirth: Date?) throws {
        
        
        if firstName.isEmpty {
            throw InputError.missingFirstName
        } else if lastName.isEmpty {
            throw InputError.missingLastName
        } else if streetAddress.isEmpty {
            throw InputError.missingStreetAddressa
        } else if city.isEmpty {
            throw InputError.missingCity
        } else if state.isEmpty {
            throw InputError.missingState
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



