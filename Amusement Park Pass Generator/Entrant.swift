//
//  Entrant.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 6/30/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation

protocol Entrant {
    var areaAccess: [AreaAccess]  { get set }
    var skipLines: Bool { get set }
    var personalInfo: PersonalInfo { get set }
}

struct PersonalInfo {
    //TODO: create variables here
}
