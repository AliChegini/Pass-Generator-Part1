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
        
        /* Ignore the repeated lines of code, I realize some refactoring is needed,
           as I am repeating myself but for now I am just trying to make it work !!! */
        
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



class Reader {
    
    enum Access {
        case granted
        case denied
    }
    
    static func swipe(entrant: AccessibleAreas) -> Bool {
        var accessGranted: Bool = false
        // I need to compare the entrant area access with the gate name but I dont know how.
        // Just to give a representation of what I want to do
        // How to tell the swipe method which gate is calling it.
        
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
}



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


    
*/


