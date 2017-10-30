//
//  MadLib.swift
//  Hacktoberfest
//
//  Created by Andrew Marmion on 29/10/2017.
//  Copyright © 2017 Andrew Marmion. All rights reserved.
//

import Foundation

/**
 This function creates a madlib
 It first unwraps the parameters and checks that their length is not zero
 Then it substitutes the values into the madlib string
 
 - parameter noun: this is a String that is a noun
 - parameter verb: this is a String that is a verb
 - parameter adjective: this is a String that is an adjective
 - parameter adverb: this is a String that is an adverb
 
 - returns: A madlib with the noun, verb, adjective, and adverb substituted in the correct place
 */
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

/**
 This function creates a story
 It asks the user to input a noun, verb, adjective, and adverb from the console.
 It then prints out a madlib using the user's inputs.
 */
func createStory() {
  print("Enter a noun: " , terminator: "")
  let noun = readLine()
  print("Enter a verb: " , terminator: "")
  let verb = readLine()
  print("Enter a adjective: " , terminator: "")
  let adjective = readLine()
  print("Enter a adverb: " , terminator: "")
  let adverb = readLine()
  
  
  createMadLib(with: noun, and: verb, and: adjective, and: adverb)
}



