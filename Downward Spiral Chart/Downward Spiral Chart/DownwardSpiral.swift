//
//  DownwardSpiral.swift
//  Downward Spiral Chart
//
//  Created by sheen vempeny on 4/15/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import Foundation
import UIKit

struct DownwardSpiral: Decodable {
    var type:String?
    var start:NSInteger?
    var ftp:Double?
}

struct SpiralCollection: Decodable {
    var spirals: [DownwardSpiral]
    
    enum CodingKeys: String, CodingKey {
        case spirals = "DownwardSpiral"
    }
}
