//
//  LiveDataModel.swift
//  ems_dashboard
//
//  Created by MAC on 21/05/2022.
//

import Foundation

//example:

//{
//    "solar_power": 7.827,
//    "quasars_power": -38.732,
//    "grid_power": 80.475,
//    "building_demand": 127.03399999999999,
//    "system_soc": 48.333333333333336,
//    "total_energy": 960,
//    "current_energy": 464.0
//}

struct LiveDataModel: Codable {
    let solar_power: Float
    let quasars_power: Float
    let grid_power: Float
    let building_demand: Float
    let system_soc: Float
    let total_energy: Float
    let current_energy: Float
}
