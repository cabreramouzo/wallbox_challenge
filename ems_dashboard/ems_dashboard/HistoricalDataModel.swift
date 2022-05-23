//
//  HistoricalDataModel.swift
//  ems_dashboard
//
//  Created by MAC on 21/05/2022.
//

import Foundation


//example:
//{
//   "building_active_power": 142.31273333333328,
//   "grid_active_power": 89.78836666666669,
//   "pv_active_power": 22.475533333333335,
//   "quasars_active_power": -30.048833333333324,
//   "timestamp": "2021-09-27T16:06:00+00:00"
//}

struct sample: Codable {
    let building_active_power: Float
    let grid_active_power: Float
    let pv_active_power: Float
    let quasars_active_power: Float
    let timestamp: Date
}
