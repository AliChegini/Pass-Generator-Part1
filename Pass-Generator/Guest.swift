//
//  Guests.swift
//  Pass-Generator
//
//  Created by Ehsan on 11/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//


class Guest: Entrant {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var entrantType: EntrantType?
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var rideAccess: [RideAccess] = [.accessAllRides]
    var dateOfBirth: Int?
    var discountOnFood: Int?
    var discountOnMerchandise: Int?
    
    init(firstName: String? = nil, lastName: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType? = nil, dateOfBirth: Int? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.entrantType = entrantType
        self.dateOfBirth = dateOfBirth
        self.discountOnFood = discountOnFood
        self.discountOnMerchandise = discountOnMerchandise
    }
    
}

class ClassicGuest: Guest {
    override init(firstName: String? = nil, lastName: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType? = nil, dateOfBirth: Int? = nil, discountOnFood: Int?  = nil, discountOnMerchandise: Int? = nil) {
        super.init()
    }
}


class VIPGuest: Guest {

    override init(firstName: String? = nil, lastName: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType? = nil, dateOfBirth: Int? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
        super.init()
        self.rideAccess = [.accessAllRides, .skipAllRides]
        self.discountOnFood = 10
        self.discountOnMerchandise = 20
    }
}


class ChildGuest: Guest {
    
    init(dateOfBirth: Int?) throws {
        super.init()
        if dateOfBirth == nil {
            throw InitializerError.missingDateOfBirth
        }
        self.dateOfBirth = dateOfBirth
    }
}

