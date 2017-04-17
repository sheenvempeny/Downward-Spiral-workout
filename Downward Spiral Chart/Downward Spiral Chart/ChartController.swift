//
//  ChartController.swift
//  Downward Spiral Chart
//
//  Created by sheen vempeny on 4/15/17.
//  Copyright © 2017 sheen vempeny. All rights reserved.
//

import Foundation
import Charts

class ChartController{
    
    weak var chartView:RadarChartView!
    var spirals:[DownwardSpiral]!
    
    func update() {
        let xSet:RadarChartDataSet = self.getSpiralValues(isStart: true)
        let ySet:RadarChartDataSet = self.getSpiralValues(isStart: false)
        let data:RadarChartData = RadarChartData(dataSets: [xSet,ySet])
        chartView.data = data
    }
 
    func updateChartDataSet(set:RadarChartDataSet,isStart:Bool){
    
        var fillColor:UIColor!
        if(isStart == true){
            
            fillColor = UIColor(colorLiteralRed: 103/255.0, green: 110/255.0, blue: 129/255.0, alpha: 1.0)
        }
        else{
            
            fillColor = UIColor(colorLiteralRed: 121/255.0, green: 162/255.0, blue: 175/255.0, alpha: 1.0)
        }
        
        set.fillColor = fillColor
        set.fillAlpha = 0.7;
        set.lineWidth = 2.0;
    }
    
    
    func getSpiralValues(isStart:Bool) -> RadarChartDataSet{
        
        var entries:[RadarChartDataEntry] = []
        var entry:RadarChartDataEntry!
        for spiral in self.spirals! {
            
            if(isStart == true){
               entry = RadarChartDataEntry(value: Double(spiral.start ))
            }
            else{
                entry = RadarChartDataEntry(value: spiral.ftp)
            }
            
            entries.append(entry)
            
        }
        
        let label = isStart == true ? "Start" : "Ftp"
        
        let newSet:RadarChartDataSet = RadarChartDataSet(values:entries , label: label)
        updateChartDataSet(set: newSet, isStart: isStart)
        return newSet
    }

}
