//
//  MadLib.swift
//  Hacktoberfest
//
//  Created by Andrew Marmion on 29/10/2017.
//  Copyright © 2017 Andrew Marmion. All rights reserved.
//

import Foundation

func createMadLib(with noun: String?, and verb: String?, and adjective: String?, and adverb: String?) {
  guard let noun = noun, noun.count > 0,
    let verb = verb, verb.count > 0,
    let adjective = adjective, adjective.count > 0,
    let adverb = adverb, adverb.count > 0 else {
      print("Please make sure you enter words for the noun, verb, adjective, and adverb.")
    return
  }
  print("Do you \(verb) your \(adjective) \(noun) \(adverb)? That's hilarious!")
}

print("Enter a noun: " , terminator: "")
let noun = readLine()
print("Enter a verb: " , terminator: "")
let verb = readLine()
print("Enter a adjective: " , terminator: "")
let adjective = readLine()
print("Enter a adverb: " , terminator: "")
let adverb = readLine()


createMadLib(with: noun, and: verb, and: adjective, and: adverb)