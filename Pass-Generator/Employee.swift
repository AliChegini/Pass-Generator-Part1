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
        }
        if lastName.isEmpty {
            throw InitializerError.missingLastName
        }
        if streetAddress.isEmpty {
            throw InitializerError.missingStreetAddress
        }
        if city.isEmpty {
            throw InitializerError.city
        }
        if state.isEmpty {
            throw InitializerError.state
        }
        if zipCode.isEmpty {
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


class FoodServiceEmployee: Employee {
    override init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        self.areaAccess = [.amusementAreas, .kitchenAreas]
    }
}


class RideServiceEmployee : Employee {
    override init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        self.areaAccess = [.amusementAreas, .rideControlAreas]
    }
}


class MaintenanceEmployee: Employee {
    override init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        self.areaAccess = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas]
    }
}


class Manager: Employee {
    override init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        self.areaAccess = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas, .officeAreas]
        self.discountOnFood = 25
        self.discountOnMerchandise = 25
    }
}

