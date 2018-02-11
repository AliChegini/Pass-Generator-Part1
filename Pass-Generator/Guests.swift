//
//  Guests.swift
//  Pass-Generator
//
//  Created by Ehsan on 11/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

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

