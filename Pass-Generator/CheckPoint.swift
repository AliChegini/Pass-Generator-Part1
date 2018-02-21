//
//  CheckPoint.swift
//  Pass-Generator
//
//  Created by Ehsan on 20/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//

enum EntrantType: String {
    case ClassicGuest
    case VIPGuest
    case ChildGuest
    case FoodServiceEmployee
    case RideServiceEmployee
    case MaintenanceEmployee
    case Manager
}

protocol EntrantTypeProtocol {
    var entrantType: EntrantType { get set }
}


// Protocol to make a new custom type for passes
// Entrant is a protocol which requires all the details
protocol Entrant: StaffInfo, AccessibleAreas, AccessibleRides, DiscountAccess, EntrantTypeProtocol {
    var dateOfBirth: Int? { get set }
}


// Struct to hold pass
struct Pass: Entrant {
    var firstName: String?
    var lastName: String?
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipCode: String?
    var entrantType: EntrantType
    var rideAccess: [RideAccess] = [.accessAllRides]
    var areaAccess: [AreaAccess] = [.amusementAreas]
    var dateOfBirth: Int?
    var discountOnFood: Int?
    var discountOnMerchandise: Int?
    
    init(firstName: String? = nil, lastName: String? = nil, streetAddress: String? = nil, city: String? = nil, state: String? = nil, zipCode: String? = nil, entrantType: EntrantType, dateOfBirth: Int? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
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


// Class to implement the logic for check point
class CheckPoint {
    
    // Static function to generate passes
    static func generatePassFor(entrant: Entrant, of type: EntrantTypeProtocol) -> Pass {
        // initialize a pass with dummy data
        var finalPass = Pass(entrantType: entrant.entrantType)
        
        switch entrant.entrantType {
        case .ClassicGuest:
            let classicGuest = ClassicGuest()
            let pass = Pass(entrantType: .ClassicGuest)
            finalPass = pass
            
        case .VIPGuest:
            let vipGuest = VIPGuest()
            let pass = Pass(entrantType: .VIPGuest)
            finalPass = pass
            
        case .ChildGuest:
            do {
                let childGuest = try ChildGuest(dateOfBirth: nil)
                let pass = Pass(entrantType: .ChildGuest)
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .FoodServiceEmployee:
            do {
                let foodServiceEmployee = try FoodServiceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode)
                let pass = Pass(firstName: foodServiceEmployee.firstName, lastName: foodServiceEmployee.lastName, entrantType: .FoodServiceEmployee)
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .RideServiceEmployee:
            do {
                let rideServiceEmployee = try RideServiceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode)
                let pass = Pass(firstName: rideServiceEmployee.firstName, lastName: rideServiceEmployee.lastName, entrantType: .RideServiceEmployee)
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .MaintenanceEmployee:
            do {
                let maintenanceEmployee = try MaintenanceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode)
                let pass = Pass(firstName: maintenanceEmployee.firstName, lastName: maintenanceEmployee.lastName, entrantType: .MaintenanceEmployee)
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .Manager:
            do {
                let manager = try Manager(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode)
                let pass = Pass(firstName: manager.firstName, lastName: manager.lastName, entrantType: .Manager)
                finalPass = pass
            } catch {
                print(error)
            }
        }
        return finalPass
    }
}


