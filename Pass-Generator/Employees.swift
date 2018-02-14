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

// Base class for Employees
class Employee: StaffInfo, AccessibleAreas, AccessibleRides, DiscountAccess {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    
    var areaAccess: [AreaAccess] = [.amusementAreas]
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


class FoodService: Employee {
    // I am really confused at this point about calling a throwable initializer
    // Is there any way to avoid repeating the following lines of code ?
    // Do I have to always check for the variables to make sure they are not empty and repeat for all the subclasses ?
    override init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        
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
        
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        // getting an error:  Call can throw but is not marked with 'try'
        // if I add the try then I am gonna need a catch clause and
        // again repaeting lots of code for all the subclasses
        // How to do it properly and is there any way to avoid this ?
    }
    
}




// Commented out for simplicity
/*

class EmployeeRideService : StaffInfo, AccessibleAreas, AccessibleRides, DiscountAccess {
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

*/
