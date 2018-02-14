//
//  Guests.swift
//  Pass-Generator
//
//  Created by Ehsan on 11/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//


class Guest: AccessibleAreas, AccessibleRides {
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var rideAccess: [RideAccess] = [.accessAllRides]
}

class ClassicGuest: Guest {
    
}


class VIPGuest: Guest, DiscountAccess {
    
    var discountOnFood: Int = 10
    var discountOnMerchandise: Int = 20
    
    override init() {
        var rideAccess: [RideAccess] = [.accessAllRides, .skipAllRides]
    }
}


class ChildGuest: Guest {
    
    var dateOfBirth: Int?
    
    init(dateOfBirth: Int?) throws {
        if dateOfBirth == nil {
            throw InitializerError.missingDateOfBirth
        }
        self.dateOfBirth = dateOfBirth
    }
    
}





