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


// Enum for Initialization errors
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
