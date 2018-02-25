//
//  CheckPoint.swift
//  Pass-Generator
//
//  Created by Ehsan on 20/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//


// Class to implement the logic for check point
// Each check point can generate new pass,
// and also check the generated pass from all other check points
class CheckPoint {
    
    // Static function to generate passes
    // Method takes an Entrant and return a Pass
    // This method can generate all type of passes
    static func generatePass(entrant: Entrant) -> Pass {
        // finalPass will be assigned with a pass to be returned
        var finalPass = Pass(entrantType: entrant.entrantType)
        
        switch entrant.entrantType {
        case .ClassicGuest:
            // Creating an instance of ClassicGuest
            let classicGuest = ClassicGuest()
            // Using the instance properties of ClassicGuest to create a pass
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
                // Creating an instance of FoodServiceEmployee
                let foodServiceEmployee = try FoodServiceEmployee(firstName: entrant.firstName, lastName: entrant.lastName, streetAddress: entrant.streetAddress, city: entrant.city, state: entrant.state, zipCode: entrant.zipCode, entrantType: entrant.entrantType)
                // Using the instance properties of foodServiceEmployee to create a pass
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
    
    
    // Method to check the pass and allow entry to areas
    // Equivalent to Swipe method
    // This method can handle all type of passes
    static func checkPassForAreaAccess(pass: Pass, to area: AreaAccess) {
        if pass.areaAccess.contains(area) {
            print("\(pass.entrantType) --- Allowed entry to \(area)")
        } else {
            print("\(pass.entrantType) --- Denied entry to \(area)")
        }
        
        // Does not work yet
        if pass.dateOfBirth != nil {
            print("Happy birthday!")
        }
    }

}


