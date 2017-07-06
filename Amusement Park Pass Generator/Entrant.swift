//
//  Entrant.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 6/30/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation

enum AreaAccess {
    case amusement
    case kitchen
    case rideControl
    case maintenance
    case office
    case allRides
    case skipLines
}

enum DiscountAccess {
    case foodDiscount(amount: Int)
    case merchDiscount(amount: Int)
}

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

