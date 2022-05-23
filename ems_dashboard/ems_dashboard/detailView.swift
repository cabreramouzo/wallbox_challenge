//
//  detailView.swift
//  ems_dashboard
//
//  Created by MAC on 20/05/2022.
//

import SwiftUI
import SwiftUICharts

func fillSamplesArrayReduced5(samples: [HistoricalDataSample]) -> [Double] {
    var arr = [Double]()
    for (idx,sample) in samples.enumerated() {
        if idx % 5 == 0 {
            arr.append(Double(sample.building_active_power))
        }
        
    }
    return arr
}

func fillSamplesArray(samples: [HistoricalDataSample]) -> [Double] {
    var arr = [Double]()
    for sample in samples {
        arr.append(Double(sample.building_active_power))
    }
    return arr
}

func fillSamplesArray2(samples: [HistoricalDataSample]) -> [Double] {
    var arr = [Double]()
    for sample in samples {
        arr.append(Double(sample.grid_active_power))
    }
    print(arr.count)
    return arr
}

struct detailView: View {
    var samples: [HistoricalDataSample]
    var body: some View {
        VStack {
            LineView(data: fillSamplesArrayReduced5(samples: samples), title: "full").padding()
            LineView(data: fillSamplesArray2(samples: samples), title: "full2").padding()
        }
        
    }
}

struct detailView_Previews: PreviewProvider {
    static var previews: some View {
        detailView(samples: [HistoricalDataSample(building_active_power: 1, grid_active_power: 1, pv_active_power: 1, quasars_active_power: 1, timestamp: "aaa")])
    }
}
