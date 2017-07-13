//
//  ViewController.swift
//  Amusement Park Pass Generator
//
//  Created by Pete McPherson on 6/29/17.
//  Copyright © 2017 Pete McPherson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        
        // TEST CASES FOR REVIEWERS
        
        
        do {
            
            // UNCOMMENT for a free child entrant denied on the basis of missing date of birth!
            
//            let someFreeChildMissingDob = try Guest(type: .freeChild, profile: PersonalInfo(firstName: "lily", lastName: "mcp", streetAddress: "111 Street", city: "Atlanta", state: "GA", zip: 12345, dateOfBirth: nil))
            
            // UNCOMMENT for a free child entrant denied on the basis of being too old!
            
//            let someFreeChildTooOld = try Guest(type: .freeChild, profile: PersonalInfo(firstName: "plkj", lastName: "sksksksksk", streetAddress: "111 street", city: "atlanta", state: "ga", zip: 12122, dateOfBirth: "02-01-2011"))
            
            // UNCOMMENT for a free child entrant allowed access!
            
//            let someFreeChild = try Guest(type: .freeChild, profile: PersonalInfo(firstName: "bobby", lastName: "mcp", streetAddress: "111 street", city: "atl", state: "ga", zip: 12345, dateOfBirth: "12-12-2014"))
            
            //UNCOMMENT for a employee creation with missing last name!. Feel free to play around!
            
//            let someEmployee = try Employee(type: .maintenance, profile: PersonalInfo(firstName: "pete", lastName: nil, streetAddress: "111 street", city: "atl", state: "ga", zip: 12312, dateOfBirth: nil))
            
            //UNCOMMENT for employee creation with BLANK city
            
//            let someEmployeeBlankCity = try Employee(type: .manager, profile: PersonalInfo(firstName: "pete", lastName: "mcp", streetAddress: "111 street", city: "", state: "ga", zip: 12345, dateOfBirth: nil))
            
            //UNCOMMENT 2 lines for a ride check access swipe (vip guest having access to skip lines??
            
//            let someVip = try Guest(type: .vip, profile: nil)
//            someVip.checkAccess(access: RideAccess.skipLines)
            
            // UNCOMMENT 2 lines for an area check access swipe (classic guest having access to food service area???
            
//            let someClassicGuest = try Guest(type: .classic, profile: nil)
//            someClassicGuest.checkAccess(access: AreaAccess.kitchen)
            
            // UNCOMMENT 2 lines for a discount check swipe (maintenance employee having 25% discount on food??
            
//            let someMaintenanceGal = try Employee(type: .maintenance, profile: PersonalInfo(firstName: "susie", lastName: "mcp", streetAddress: "111 street", city: "atl", state: "ga", zip: 12345, dateOfBirth: nil))
//            someMaintenanceGal.checkAccess(access: DiscountAccess.foodDiscount25)
            
        } catch InputError.missingDateOfBirth {
            print("no dob")
        } catch InputError.tooOld {
            print("kid is too old")
        }
        catch InputError.missingFirstName {
            print("no first name")
        } catch InputError.missingLastName {
            print("no last name")
        } catch InputError.missingAddress {
            print("no address")
        } catch InputError.missingCity {
            print("no city")
        } catch InputError.missingState {
            print("no state")
        } catch InputError.missingZip {
            print("no zip")
        } catch {
            print("other error!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

