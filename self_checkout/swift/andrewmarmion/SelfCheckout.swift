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

func convertCostToNumber(totalCost: [Item?]) -> Double {
  let value = totalCost.flatMap { $0 }.flatMap { $0.price * $0.quantity }.reduce(0, +)
  return value
}

let taxRate:Double = 5.5
var itemCost: [Item?] = []
let itemCount: Int = 3

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