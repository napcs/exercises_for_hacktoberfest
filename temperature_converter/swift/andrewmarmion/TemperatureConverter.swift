//
//  TemperatureConverter.swift
//  Hacktoberfest
//
//  Created by Andrew Marmion on 29/10/2017.
//  Copyright © 2017 Andrew Marmion. All rights reserved.
//

import Foundation

func createStatement(letter: String) -> String {
  var temp1 = "Celsius"
  var temp2 = "Fahrenheit"
  
  if letter == "F" {
    let temp = temp1
    temp1 = temp2
    temp2 = temp
  }
  return "Press \(letter) to convert from \(temp2) to \(temp1)"
}

func checkLetter(input: String?) -> ValidLetter {
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

func calculateNewTemperature(from temperature: Temperature) {
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

func calculateTemp(for temp: Double, from temperature: Temperature) {
  switch temperature {
  case .fahrenheit:
    let answer = (temp - 32.0) * 5 / 9
    print("Temperature in Celsius is \(answer)\n")
  case .celsius:
    let answer = temp * 1.8 + 32.0
    print("Temperature in Fahrenheit is  \(answer)\n")
  }
}

enum Temperature: String {
  case celsius
  case fahrenheit
}

enum ValidLetter {
  case celsius
  case fahrenheit
  case invalid
}


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