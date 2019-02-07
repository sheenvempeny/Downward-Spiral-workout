//
//  DataFetcher.swift
//  Downward Spiral Chart
//
//  Created by Sheen on 1/26/19.
//  Copyright © 2019 sheen vempeny. All rights reserved.
//

import Foundation

class DataFetcher {
    
    let dataFileName = "DownwardSpiral"
    func fetchSpirals(handler: ((SpiralCollection?) -> Void)) {
         //Network call or use local file here. In this work, no network call so we are using the local file
        downloadDataFromFile { (data: Data?) in
            guard let data = data else {
                handler(nil)
                return
            }
            parseSpiral(data: data, handler: { (collection: SpiralCollection?) in
                handler(collection)
            })
        }
    }
}

//MARK: Data
private extension DataFetcher {
    
    func downloadDataFromFile(handler: ((Data?) -> Void)) {
        guard let filePath = Bundle.main.path(forResource: dataFileName, ofType: "json") else {
            handler(nil)
            return
        }
        let fileUrl = URL(fileURLWithPath: filePath)
        guard let data = try? Data(contentsOf: fileUrl) else {
            handler(nil)
            return
        }
        handler(data)
    }
    
    func parseSpiral(data: Data, handler: ((SpiralCollection?) -> Void) ) {
        do {
            let decoder = JSONDecoder()
            let spiralCollection = try decoder.decode(SpiralCollection.self, from: data)
            handler(spiralCollection)
        } catch let error {
            print(error)
            handler(nil)
        }
        
    }
    
}
