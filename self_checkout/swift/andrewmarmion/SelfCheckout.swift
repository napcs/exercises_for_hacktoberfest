//
//  SelfCheckout.swift
//  Hacktoberfest
//
//  Created by Andrew Marmion on 29/10/2017.
//  Copyright © 2017 Andrew Marmion. All rights reserved.
//

import Foundation

struct Item {
  let price: Double
  let quantity: Double
  
  init?(cost: String?, amount: String?) {
    guard let cost = cost, let amount = amount else { return nil }
    guard let price = Double(cost), let quantity = Double(amount) else  { return nil }
    
    self.price = price
    self.quantity = quantity
  }
}

/**
 This function converts the array of strings into a total cost
 it does this by first removing all nil values then calculating
 the total cost of each item, then it sums the total
 
 - parameter totalCost: An array of Items
 
 - returns: the total cost of all the items
 */
func convertCostToNumber(totalCost: [Item?]) -> Double {
  let value = totalCost.flatMap { $0 }.flatMap { $0.price * $0.quantity }.reduce(0, +)
  return value
}


/**
 This function creates a checkout for the given number of items
 
 - parameter items: the number of different items in the checkout
 - parameter taxRate: the tax rate to be applied to the transaction
 */
func createCheckout(for items: Int, with taxRate: Double) {
  var itemCost: [Item?] = []
  let itemCount: Int = items
  
  for i in 1...itemCount {
    print("Enter price of item \(i): ", terminator: "")
    let value = readLine()
    print ("Enter quantity of item \(i): ", terminator: "")
    let quantity = readLine()
    itemCost.append(Item(cost: value, amount: quantity))
  }
  
  let subtotal = convertCostToNumber(totalCost: itemCost)
  let tax = subtotal * taxRate / 100.0
  let total = subtotal + tax
  
  
  
  print("Subtotal: $\(String(format: "%.2f", subtotal))")
  print("Tax: $\(String(format: "%.2f", tax))")
  print("Total: $\(String(format: "%.2f", total))")
  
}


