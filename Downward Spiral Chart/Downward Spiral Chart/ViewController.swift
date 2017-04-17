//
//  ViewController.swift
//  Downward Spiral Chart
//
//  Created by sheen vempeny on 4/15/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    
    lazy var spirals:[DownwardSpiral]? = JsonParser.spirals(fileName: "DownwardSpiral")
    var chartController:ChartController!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.chartController = ChartController()
        self.chartController.chartView = self.view as! RadarChartView
        self.chartController.spirals = self.spirals
        self.chartController.update()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        
    

}

