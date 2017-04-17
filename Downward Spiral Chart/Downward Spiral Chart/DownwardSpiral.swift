//
//  DownwardSpiral.swift
//  Downward Spiral Chart
//
//  Created by sheen vempeny on 4/15/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import Foundation
import UIKit

struct DownwardSpiral{
    
    var type:String!
    var start:NSInteger!
    var ftp:Double!
    
}

enum SerializationError: Error {
    case missing(String)
    case invalid(String, Any)
}

extension DownwardSpiral {
    
    init(json: [String: Any]) throws {
        // Extract name
        guard let type = json["type"] as? String else {
            throw SerializationError.missing("type")
        }
        
        // Extract start
        guard let start = json["start"] as? NSInteger
            else {
                throw SerializationError.missing("start")
        }
        // Extract ftp
        guard let ftp = json["ftp"] as? Double
            else {
                throw SerializationError.missing("ftp")
        }
        
        // Initialize properties
        self.type = type
        self.start = start
        self.ftp = ftp
    }
}

class JsonParser{
    
    class func spirals(fileName:String) -> [DownwardSpiral]?{
        
        var spirals:[DownwardSpiral] = []
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    
                   if let json = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as? [String: Any],
                      let inSpirals = json["DownwardSpiral"] as? [[String: Any]] {
                    
                        for inSPiral in inSpirals{
                        
                            try spirals.append(DownwardSpiral.init(json:inSPiral ))
                        }
                    }

                  
                } catch {
                    print("Error!! Unable to parse  \(fileName).json")
                }
            }
           
        }
        
        return spirals
        
    }
    
    
}
