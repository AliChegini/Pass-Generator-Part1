//
//  Model.swift
//  Pass-Generator
//
//  Created by Ehsan on 18/01/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

import Foundation

enum AreaAccess {
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


protocol AreaAndRideAccess {
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
}

enum InitializerError: Error {
    case missingDateOfBirth
    case missingInfo
}

struct ClassicGuest: AreaAndRideAccess {
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var rideAccess: [RideAccess] = [.accessAllRides]
}


struct VIPGuest: AreaAndRideAccess, DiscountAccess {
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var rideAccess: [RideAccess] = [.accessAllRides, .skipAllRides]
    
    var discountOnFood: Int = 10
    var discountOnMerchandise: Int = 20
}


struct FreeChildGuest: AreaAndRideAccess {
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
struct EmployeeFoodService: StaffInfo, AreaAndRideAccess, DiscountAccess {
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
        if firstName.isEmpty || lastName.isEmpty || streetAddress.isEmpty || city.isEmpty || state.isEmpty || zipCode.isEmpty {
            throw InitializerError.missingInfo
        }
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}


struct EmployeeRideService : StaffInfo, AreaAndRideAccess, DiscountAccess {
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
        if firstName.isEmpty || lastName.isEmpty || streetAddress.isEmpty || city.isEmpty || state.isEmpty || zipCode.isEmpty {
            throw InitializerError.missingInfo
        }
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}


struct EmployeeMaintenance: StaffInfo, AreaAndRideAccess, DiscountAccess {
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
        if firstName.isEmpty || lastName.isEmpty || streetAddress.isEmpty || city.isEmpty || state.isEmpty || zipCode.isEmpty {
            throw InitializerError.missingInfo
        }
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}


struct Manager: StaffInfo, AreaAndRideAccess, DiscountAccess {
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
        if firstName.isEmpty || lastName.isEmpty || streetAddress.isEmpty || city.isEmpty || state.isEmpty || zipCode.isEmpty {
            throw InitializerError.missingInfo
        }
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}
