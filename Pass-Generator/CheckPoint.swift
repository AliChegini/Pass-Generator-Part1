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


// Protocol to make a new custom type for passes
protocol Entrant: AccessibleAreas, AccessibleRides, DiscountAccess {
    var entrantType: EntrantType { get set }
}




// Struct to hold pass
struct Pass: Entrant {
    var firstName: String?
    var lastName: String?
    var entrantType: EntrantType
    var rideAccess: [RideAccess]
    var areaAccess: [AreaAccess]
    var dateOfBirth: Int?
    var discountOnFood: Int?
    var discountOnMerchandise: Int?
    
    init(firstName: String? = nil, lastName: String? = nil, entrantType: EntrantType, rideAccess: [RideAccess], areaAccess: [AreaAccess], dateOfBirth: Int? = nil, discountOnFood: Int? = nil, discountOnMerchandise: Int? = nil) {
        self.entrantType = entrantType
        self.rideAccess = rideAccess
        self.areaAccess = areaAccess
        self.dateOfBirth = dateOfBirth
        self.discountOnFood = discountOnFood
        self.discountOnMerchandise = discountOnMerchandise
    }
}


// Class to implement the logic for check point
class CheckPoint {
    
    // Static function to generate passes
    static func generatePass(entrant: Entrant, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String) -> Pass {
        // initialize a pass with dummy data
        var finalPass = Pass(entrantType: entrant.entrantType, rideAccess: [.accessAllRides], areaAccess: [.amusementAreas])
        
        switch entrant.entrantType {
        case .ClassicGuest:
            let classicGuest = ClassicGuest()
            let pass = Pass(entrantType: .ClassicGuest, rideAccess: classicGuest.rideAccess, areaAccess: classicGuest.areaAccess)
            finalPass = pass
            
        case .VIPGuest:
            let vipGuest = VIPGuest()
            let pass = Pass(entrantType: .VIPGuest, rideAccess: vipGuest.rideAccess, areaAccess: vipGuest.areaAccess)
            finalPass = pass
            
        case .ChildGuest:
            do {
                let childGuest = try ChildGuest(dateOfBirth: nil)
                let pass = Pass(entrantType: .ChildGuest, rideAccess: childGuest.rideAccess, areaAccess: childGuest.areaAccess)
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .FoodServiceEmployee:
            do {
                let foodServiceEmployee = try FoodServiceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
                let pass = Pass(firstName: firstName, lastName: lastName, entrantType: .FoodServiceEmployee, rideAccess: foodServiceEmployee.rideAccess, areaAccess: foodServiceEmployee.areaAccess, discountOnFood: foodServiceEmployee.discountOnFood, discountOnMerchandise: foodServiceEmployee.discountOnMerchandise)
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .RideServiceEmployee:
            do {
                let rideServiceEmployee = try RideServiceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
                let pass = Pass(firstName: firstName, lastName: lastName, entrantType: .RideServiceEmployee, rideAccess: rideServiceEmployee.rideAccess, areaAccess: rideServiceEmployee.areaAccess, discountOnFood: rideServiceEmployee.discountOnFood, discountOnMerchandise: rideServiceEmployee.discountOnMerchandise)
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .MaintenanceEmployee:
            do {
                let maintenanceEmployee = try MaintenanceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
                let pass = Pass(firstName: firstName, lastName: lastName, entrantType: .MaintenanceEmployee, rideAccess: maintenanceEmployee.rideAccess, areaAccess: maintenanceEmployee.areaAccess, discountOnFood: maintenanceEmployee.discountOnFood, discountOnMerchandise: maintenanceEmployee.discountOnMerchandise)
                finalPass = pass
            } catch {
                print(error)
            }
            
        case .Manager:
            do {
                let manager = try Manager(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
                let pass = Pass(firstName: firstName, lastName: lastName, entrantType: .Manager, rideAccess: manager.rideAccess, areaAccess: manager.areaAccess, discountOnFood: manager.discountOnFood, discountOnMerchandise: manager.discountOnMerchandise)
                finalPass = pass
            } catch {
                print(error)
            }
        }
        return finalPass
    }
}


