//
//  Staff.swift
//  Pass-Generator
//
//  Created by Ehsan on 11/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

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

// Check out the delegates videos and how to use them
// All the structs are doing the same thing so they might be possible to do with delegates
