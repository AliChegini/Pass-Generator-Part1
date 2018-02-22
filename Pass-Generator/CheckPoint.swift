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

// Protocol to make a custom type Entrant for all the passes
// Entrant is a protocol which requires all the details
protocol Entrant: StaffInfo, AccessibleAreas, AccessibleRides, DiscountAccess {
    var entrantType: EntrantType { get set }
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
    var rideAccess: [RideAccess] = []
    var areaAccess: [AreaAccess] = []
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
    static func generatePass(entrant: Entrant) -> Pass {
        // initialize a pass with dummy data
        var finalPass = Pass(entrantType: entrant.entrantType)
        
        switch entrant.entrantType {
        case .ClassicGuest:
            let classicGuest = ClassicGuest()
            var pass = Pass(entrantType: classicGuest.entrantType)
            pass.rideAccess = classicGuest.rideAccess
            pass.areaAccess = classicGuest.areaAccess
            
            finalPass = pass
            
        case .VIPGuest:
            let vipGuest = VIPGuest()
            var pass = Pass(entrantType: vipGuest.entrantType)
            pass.rideAccess = vipGuest.rideAccess
            pass.areaAccess = vipGuest.areaAccess
            
            finalPass = pass
            
        case .ChildGuest:
            do {
                let childGuest = try ChildGuest(dateOfBirth: entrant.dateOfBirth, entrantType: entrant.entrantType)
                var pass = Pass(entrantType: childGuest.entrantType)
                pass.rideAccess = childGuest.rideAccess
                pass.areaAccess = childGuest.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .FoodServiceEmployee:
            do {
                let foodServiceEmployee = try FoodServiceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType)
                var pass = Pass(firstName: foodServiceEmployee.firstName, lastName: foodServiceEmployee.lastName, entrantType: foodServiceEmployee.entrantType)
                pass.rideAccess = foodServiceEmployee.rideAccess
                pass.areaAccess = foodServiceEmployee.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .RideServiceEmployee:
            do {
                let rideServiceEmployee = try RideServiceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType)
                var pass = Pass(firstName: rideServiceEmployee.firstName, lastName: rideServiceEmployee.lastName, entrantType: rideServiceEmployee.entrantType)
                pass.rideAccess = rideServiceEmployee.rideAccess
                pass.areaAccess = rideServiceEmployee.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .MaintenanceEmployee:
            do {
                let maintenanceEmployee = try MaintenanceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType)
                var pass = Pass(firstName: maintenanceEmployee.firstName, lastName: maintenanceEmployee.lastName, entrantType: maintenanceEmployee.entrantType)
                pass.rideAccess = maintenanceEmployee.rideAccess
                pass.areaAccess = maintenanceEmployee.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .Manager:
            do {
                let manager = try Manager(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType)
                var pass = Pass(firstName: manager.firstName, lastName: manager.lastName, entrantType: manager.entrantType)
                pass.rideAccess = manager.rideAccess
                pass.areaAccess = manager.areaAccess
                
                finalPass = pass
            } catch {
                print(error)
            }
        }
        return finalPass
    }
    
    
    // Static function to validate the pass and allow entry to areas
    static func validate(pass: Pass, at gate: AreaAccess) {
        if pass.areaAccess.contains(gate) {
            print("Allowed entry to \(gate)")
        } else {
            print("Denied entry to \(gate)")
        }
    }

}


