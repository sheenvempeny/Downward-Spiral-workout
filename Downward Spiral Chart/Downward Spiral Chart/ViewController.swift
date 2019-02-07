//
//  ViewController.swift
//  Downward Spiral Chart
//
//  Created by sheen vempeny on 4/15/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import UIKit
import TEAChart

final class ViewController: UIViewController {
    
    @IBOutlet fileprivate weak var chartView: TEABarChart!
    fileprivate var spiralFetcher: DataFetcher!
    fileprivate var spirals: [DownwardSpiral]! {
        didSet {
            chartView.data = spirals.map( { $0.start ?? 0 } )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChart()
        setupSpiralDownloader()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//MARK: Chart Setup
fileprivate extension ViewController {
    
    func setupChart() {
        chartView.barSpacing = 0
        chartView.barColor = UIColor.purple
    }
}

//MARK: Sprial setup
fileprivate extension ViewController {
    
    func setupSpiralDownloader() {
        spiralFetcher = DataFetcher()
        spiralFetcher.fetchSpirals { [weak self] (collection: SpiralCollection?) in
            guard let strongSelf = self, let spirals = collection?.spirals else { return }
            strongSelf.spirals = spirals
        }
    }
}

