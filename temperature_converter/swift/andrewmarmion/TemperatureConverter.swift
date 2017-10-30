//
//  TemperatureConverter.swift
//  Hacktoberfest
//
//  Created by Andrew Marmion on 29/10/2017.
//  Copyright © 2017 Andrew Marmion. All rights reserved.
//

import Foundation

enum Temperature: String {
  case celsius
  case fahrenheit
}

enum ValidLetter {
  case celsius
  case fahrenheit
  case invalid
}

/**
 This method creates the option statement
 
 - parameter letter: String
 
 - returns: the statement
 */
private func createStatement(letter: String) -> String {
  var temp1 = "Celsius"
  var temp2 = "Fahrenheit"
  
  if letter == "F" {
    let temp = temp1
    temp1 = temp2
    temp2 = temp
  }
  return "Press \(letter) to convert from \(temp2) to \(temp1)"
}


/**
 This function checks the letter and returns the correct response
 
 - parameter input: the string the user entered
 
 - returns: a ValidLetter
 */
private func checkLetter(input: String?) -> ValidLetter {
  if let input = input {
    switch input {
    case "C","c":
      return .celsius
    case "F","f":
      return .fahrenheit
    default:
      return .invalid
    }
  } else {
    return .invalid
  }
}

/**
 This function checks to make sure that a valid temperature has been given then
 facilitates the conversion
 
 - parameter temperature: the temperature that the user wants to convert from
 */
private func calculateNewTemperature(from temperature: Temperature) {
  print("Please enter the temperature in \(temperature.rawValue.capitalized): ", terminator: "")
  let input = readLine()
  if let input = input {
    if let numberInput = Double(input) {
      calculateTemp(for: numberInput, from: temperature)
    } else {
      print("\nPlease input a number for your temperature.\n")
    }
  } else {
    print("\nPlease enter a valid input.\n")
  }
}

/**
 This function calculates the correct temperature
 
 - parameter temp: the current temperature
 - parameter temperature: the units of the current temperature
 */
private func calculateTemp(for temp: Double, from temperature: Temperature) {
  switch temperature {
  case .fahrenheit:
    let answer = (temp - 32.0) * 5 / 9
    print("Temperature in Celsius is \(answer)\n")
  case .celsius:
    let answer = temp * 1.8 + 32.0
    print("Temperature in Fahrenheit is  \(answer)\n")
  }
}



/**
 This function continually asks the user to convert a temperature
 */
func convertTemperatures() {
  while true {
    print(createStatement(letter: "C"))
    print(createStatement(letter: "F"))
    print("Your choice: " , terminator: "")
    let answer = readLine()
    print("")
    
    switch checkLetter(input: answer) {
    case .celsius:
      calculateNewTemperature(from: .fahrenheit)
      break
    case .fahrenheit:
      calculateNewTemperature(from: .celsius)
      break
    case .invalid:
      print("Please enter a valid letter.\n")
      break
    }
  }
  
}

