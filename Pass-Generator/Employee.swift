//
//  Staff.swift
//  Pass-Generator
//
//  Created by Ehsan on 11/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//


// Base class for Employees
class Employee: Entrant {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var areaAccess: [AreaAccess] = []
    var rideAccess: [RideAccess] = []
    var discountOnFood: Int? = 15
    var discountOnMerchandise: Int? = 25
    var entrantType: EntrantType
    var dateOfBirth: Int?
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType) throws {
        
        guard let firstNameUnwrapped = firstName else {
            throw InitializerError.missingFirstName
        }
        
        guard let lastNameUnwrapped = lastName else {
            throw InitializerError.missingLastName
        }
        
        guard let streetAddressUnwrapped = streetAddress else {
            throw InitializerError.missingStreetAddress
        }
        
        guard let cityUnwrapped = city else {
            throw InitializerError.missingCity
        }
        
        guard let stateUnwrapped = state else {
            throw InitializerError.missingState
        }
        
        guard let zipCodeUnwrapped = zipCode else {
            throw InitializerError.missingZipCode
        }
       
        self.firstName = firstNameUnwrapped
        self.lastName = lastNameUnwrapped
        self.streetAddress = streetAddressUnwrapped
        self.city = cityUnwrapped
        self.state = stateUnwrapped
        self.zipCode = zipCodeUnwrapped
        self.entrantType = entrantType
    }
}


class FoodServiceEmployee: Employee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .FoodServiceEmployee) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType)
        self.areaAccess = [.amusementAreas, .kitchenAreas]
    }
}


class RideServiceEmployee : Employee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .RideServiceEmployee) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType)
        self.areaAccess = [.amusementAreas, .rideControlAreas]
    }
}


class MaintenanceEmployee: Employee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .MaintenanceEmployee) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType)
        self.areaAccess = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas]
    }
}


class Manager: Employee {
    override init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipCode: String?, entrantType: EntrantType = .Manager) throws {
        try super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, entrantType: entrantType)
        self.areaAccess = [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas, .officeAreas]
        self.discountOnFood = 25
        self.discountOnMerchandise = 25
    }
}

