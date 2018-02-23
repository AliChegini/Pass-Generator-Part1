//
//  TestCases.swift
//  Pass-Generator
//
//  Created by Ehsan on 22/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//



// By running the app, the test method will be called from ViewController,
// and all the test cases will be executed
func test() {
    
    // success case for classic guest entering amusement areas -- allowed
    print("Test case 1 ...")
    let classicGuest = ClassicGuest()
    let classicPass = CheckPoint.generatePass(entrant: classicGuest)
    CheckPoint.checkPassForAreaAccess(pass: classicPass, to: .amusementAreas)
    print("--- ")
    
    
    // fail case for VIP guest entering kitchen --- denied
    print("Test case 2 ...")
    let vipGuest = VIPGuest()
    let vipPass = CheckPoint.generatePass(entrant: vipGuest)
    CheckPoint.checkPassForAreaAccess(pass: vipPass, to: .kitchenAreas)
    print("--- ")
    
    
    // fail case for generating pass with missing first name to trigger the error
    do {
        print("Test case 3 ...")
        let foodServiceEmployee = try FoodServiceEmployee(firstName: nil, lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234")
        let kitchenPass = CheckPoint.generatePass(entrant: foodServiceEmployee)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // success case for food service employee enetring the kitchen --- allowed
    do {
        print("Test case 4 ...")
        let foodServiceEmployee = try FoodServiceEmployee(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234")
        let kitchenPass = CheckPoint.generatePass(entrant: foodServiceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: kitchenPass, to: .kitchenAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    // success case for ride service employee enetring the ride area --- allowed
    do {
        print("Test case 5 ...")
        let rideServiceEmployee = try RideServiceEmployee(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234")
        let ridePass = CheckPoint.generatePass(entrant: rideServiceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: ridePass, to: .rideControlAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // success case for maintenance employee enetring the maintenance area --- allowed
    do {
        print("Test case 6 ...")
        let maintenanceEmployee = try MaintenanceEmployee(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234")
        let maintenancePass = CheckPoint.generatePass(entrant: maintenanceEmployee)
        CheckPoint.checkPassForAreaAccess(pass: maintenancePass, to: .maintenanceAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    // success case for manager enetring the office area --- allowed
    do {
        print("Test case 7 ...")
        let manager = try Manager(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234")
        let managerPass = CheckPoint.generatePass(entrant: manager)
        CheckPoint.checkPassForAreaAccess(pass: managerPass, to: .officeAreas)
        print("--- ")
    } catch {
        print("Error: \(error)")
        print("--- ")
    }
    
    
    
}
