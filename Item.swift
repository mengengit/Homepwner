//
//  Item.swift
//  Homepwner
//
//  Created by Mark Engen on 9/24/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Shiny", "Rusty", "Abused", "Antique"]
            print(adjectives)
            let nouns = ["Motorcycle", "Ferarri", "Chevelle", "Riviera"]
            print(nouns)
            var idx = arc4random_uniform(UInt32(adjectives.count))
            print ("idx is now \(idx) via random number applied to adjectives array.")
            let randomAdjective = adjectives[Int(idx)]
            print("\(randomAdjective)")
            idx = arc4random_uniform(UInt32(nouns.count))
            print ("idx is now \(idx) via random number applied to nouns array.")
            let randomNoun = nouns[Int(idx)]
            print("\(randomNoun)")
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name:randomName,
                      serialNumber: randomSerialNumber,
                      valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
}
