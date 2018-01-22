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


protocol RequiredInfo {
    var dateOfBirth: Data { get set }
}


protocol AreaAndRideAccess {
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    
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
    
}

class Staff {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
    
}



