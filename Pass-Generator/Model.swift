//
//  Model.swift
//  Pass-Generator
//
//  Created by Ehsan on 18/01/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import Foundation

enum AreaAccess: String {
    case amusementAreas
    case kitchenAreas
    case rideControlAreas
    case maintenanceAreas
    case officeAreas
}

enum RideAccess {
    case accessAllRides
    case skipAllRides
}


protocol DiscountAccess {
    var discountOnFood: Int? { get set }
    var discountOnMerchandise: Int? { get set }
}


protocol AccessibleAreas {
    var areaAccess: [AreaAccess] { get }
}

protocol AccessibleRides {
    var rideAccess: [RideAccess] { get }
}


// Enum for the errors
enum InitializerError: Error {
    case missingDateOfBirth
    case missingFirstName
    case missingLastName
    case missingStreetAddress
    case city
    case state
    case zipCode
}


// Protocol for Staff info
protocol StaffInfo {
    var firstName: String? { get set }
    var lastName: String? { get set }
    var streetAddress: String? { get set }
    var city: String? { get set }
    var state: String? { get set }
    var zipCode: String? { get set }
}


    /*
    static func check(entrant: AccessibleAreas) -> Bool {
        var accessGranted: Bool = false
        for area in entrant.areaAccess {
            switch area {
            case .amusementAreas:
                accessGranted = true
            case .kitchenAreas:
                accessGranted = true
            case .maintenanceAreas:
                accessGranted = true
            case .officeAreas:
                accessGranted = true
            case .rideControlAreas:
                accessGranted = true
            default: return false
            }
        }
        return accessGranted
    }
    */


// This is another attempt to create 5 different gates
// so the swipe method knows which gate is being called from
// Not sure! trying to do polymorphism by making the swipe methods taking a unique input type
// I have read the following: http://sketchytech.blogspot.dk/2014/09/polymorphism-in-swift-xcode-601.html

/*
struct AmusementGate {
    static func swipe(user: AccessibleAreas) -> Bool {
        for area in user.areaAccess {
            if area == AreaAccess.amusementAreas {
                return true
            }
        }
        print("Denied access to amusement areas")
        return false
    }
}


struct KitchenGate {
    static func swipe(user: AccessibleAreas) -> Bool {
        for area in user.areaAccess {
            if area == AreaAccess.kitchenAreas {
                return true
            }
        }
        print("Denied access to kitchen areas")
        return false
    }
}


struct RideControlGate {
    static func swipe(user: AccessibleAreas) -> Bool {
        for area in user.areaAccess {
            if area == AreaAccess.rideControlAreas {
                return true
            }
        }
        print("Denied access to ride control areas")
        return false
    }
}


struct MaintenanceGate {
    static func swipe(user: AccessibleAreas) -> Bool {
        for area in user.areaAccess {
            if area == AreaAccess.maintenanceAreas {
                return true
            }
        }
        print("Denied access to maintenance areas")
        return false
    }
}


struct OfficeGate {
    static func swipe(user: AccessibleAreas) -> Bool {
        for area in user.areaAccess {
            if area == AreaAccess.officeAreas {
                return true
            }
        }
        print("Denied access to office areas")
        return false
    }
}

*/



func trying() {
    
    let guest = ClassicGuest()
    print(CheckPoint.generatePass(entrant: guest))
 
}





