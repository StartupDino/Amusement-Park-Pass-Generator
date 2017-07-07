//
//  ErrorHandling.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 7/6/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import Foundation


enum InputError: Error {
    case missingInput(required: String)
    case invalidDateOfBirth
}
