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
    var discountOnFood: Int { get set }
    var discountOnMerchandise: Int { get set }
}


protocol AccessibleAreas {
    var areaAccess: [AreaAccess] { get }
}

protocol AccessibleRides {
    var rideAccess: [RideAccess] { get }
}

enum InitializerError: Error {
    case missingDateOfBirth
    case missingFirstName
    case missingLastName
    case missingStreetAddress
    case city
    case state
    case zipCode
}

struct ClassicGuest: AccessibleAreas, AccessibleRides {
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var rideAccess: [RideAccess] = [.accessAllRides]
}


struct VIPGuest: AccessibleAreas, AccessibleRides, DiscountAccess {
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var rideAccess: [RideAccess] = [.accessAllRides, .skipAllRides]
    
    var discountOnFood: Int = 10
    var discountOnMerchandise: Int = 20
}


struct FreeChildGuest: AccessibleAreas, AccessibleRides {
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var rideAccess: [RideAccess] = [.accessAllRides]
    
    var dateOfBirth: Int?
    
    init(dateOfBirth: Int?) throws {
        if dateOfBirth == nil {
            throw InitializerError.missingDateOfBirth
        }
        self.dateOfBirth = dateOfBirth
    }
    
}

// Protocol for Staff info
protocol StaffInfo {
    var firstName: String { get }
    var lastName: String { get }
    var streetAddress: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: String { get }
}

// Structs to represent different types of employees
struct EmployeeFoodService: StaffInfo, AccessibleAreas, AccessibleRides, DiscountAccess {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    
    var areaAccess: [AreaAccess] = [.amusementAreas, .kitchenAreas]
    var rideAccess: [RideAccess] = [.accessAllRides]
    
    var discountOnFood: Int = 15
    var discountOnMerchandise: Int = 25
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        
        if firstName.isEmpty {
            throw InitializerError.missingFirstName
        } else if lastName.isEmpty {
            throw InitializerError.missingLastName
        } else if streetAddress.isEmpty {
            throw InitializerError.missingStreetAddress
        } else if city.isEmpty {
            throw InitializerError.city
        } else if state.isEmpty {
            throw InitializerError.state
        } else if zipCode.isEmpty {
            throw InitializerError.zipCode
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}


struct EmployeeRideService : StaffInfo, AccessibleAreas, AccessibleRides, DiscountAccess {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    
    var areaAccess: [AreaAccess] = [.amusementAreas, .rideControlAreas]
    var rideAccess: [RideAccess] = [.accessAllRides]
    
    var discountOnFood: Int = 15
    var discountOnMerchandise: Int = 25
    
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        
        if firstName.isEmpty {
            throw InitializerError.missingFirstName
        } else if lastName.isEmpty {
            throw InitializerError.missingLastName
        } else if streetAddress.isEmpty {
            throw InitializerError.missingStreetAddress
        } else if city.isEmpty {
            throw InitializerError.city
        } else if state.isEmpty {
            throw InitializerError.state
        } else if zipCode.isEmpty {
            throw InitializerError.zipCode
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}


struct EmployeeMaintenance: StaffInfo, AccessibleAreas, AccessibleRides, DiscountAccess {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    
    var areaAccess: [AreaAccess] = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas]
    var rideAccess: [RideAccess] = [.accessAllRides]
    
    var discountOnFood: Int = 15
    var discountOnMerchandise: Int = 25
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        
        if firstName.isEmpty {
            throw InitializerError.missingFirstName
        } else if lastName.isEmpty {
            throw InitializerError.missingLastName
        } else if streetAddress.isEmpty {
            throw InitializerError.missingStreetAddress
        } else if city.isEmpty {
            throw InitializerError.city
        } else if state.isEmpty {
            throw InitializerError.state
        } else if zipCode.isEmpty {
            throw InitializerError.zipCode
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}


struct Manager: StaffInfo, AccessibleAreas, AccessibleRides, DiscountAccess {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    
    var areaAccess: [AreaAccess] = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas, .officeAreas]
    var rideAccess: [RideAccess] = [.accessAllRides]
    
    var discountOnFood: Int = 25
    var discountOnMerchandise: Int = 25
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        
        if firstName.isEmpty {
            throw InitializerError.missingFirstName
        } else if lastName.isEmpty {
            throw InitializerError.missingLastName
        } else if streetAddress.isEmpty {
            throw InitializerError.missingStreetAddress
        } else if city.isEmpty {
            throw InitializerError.city
        } else if state.isEmpty {
            throw InitializerError.state
        } else if zipCode.isEmpty {
            throw InitializerError.zipCode
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}

// Make a protocol that requires two swipe methods and accessAreas, rideAccess
// create 5 gates - struct - that conforms to the protocol
// think about the input type for this method in a way that
// all the gates works with same type of input !
// refer to http://sketchytech.blogspot.dk/2014/09/polymorphism-in-swift-xcode-601.html
/*
 case amusementAreas
 case kitchenAreas
 case rideControlAreas
 case maintenanceAreas
 case officeAreas
 */


struct AmusementGate {
    static func swipe(user: AccessibleAreas) -> Bool {
        for area in user.areaAccess {
            if area == AreaAccess.amusementAreas {
                return true
            }
        }
        return false
    }
}


func trying() {
    
    let guest = ClassicGuest()
    print(AmusementGate.swipe(user: guest))
    /*
    do {
        let manager = try Manager(firstName: "jimmi", lastName: "jimson", streetAddress: "ab", city: "new york", state: "DC", zipCode: "1234")
        print(AmusementGate.swipe(user: manager))
    } catch {
        print("Error")
    }
    */
}


    

    















