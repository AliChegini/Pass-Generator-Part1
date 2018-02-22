//
//  TestCases.swift
//  Pass-Generator
//
//  Created by Ehsan on 22/02/2018.
//  Copyright © 2018 Ali C. All rights reserved.
//


func trying() {
    
    let classicGuest = ClassicGuest()
    //print("Classic Guest Pass: ", CheckPoint.generatePass(entrant: classicGuest))
    
    do {
        let foodServiceEmployee = try FoodServiceEmployee(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234")
        //print("Food Service Employee Pass: ", CheckPoint.generatePass(entrant: foodServiceEmployee))
    } catch {
        print(error)
    }
    
    
    do {
        let foodServiceEmployee = try FoodServiceEmployee(firstName: "jimmi", lastName: "jimson", streetAddress: "abc aVN", city: "ibiza", state: "spain", zipCode: "1234")
        let pass = CheckPoint.generatePass(entrant: foodServiceEmployee)
        CheckPoint.validate(pass: pass, at: .kitchenAreas)
    } catch {
        print(error)
    }
}
