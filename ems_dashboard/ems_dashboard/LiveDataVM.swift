//
//  LiveDataVM.swift
//  ems_dashboard
//
//  Created by MAC on 21/05/2022.
//

import Foundation

final class LiveDataViewModel: ObservableObject {
    @Published var liveData = LiveDataModel(solar_power: 1, quasars_power: 1, grid_power: 1, building_demand: 1, system_soc: 1, total_energy: 1, current_energy: 1)
    
    init() {
        let file = "live_data"
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
                    fatalError("Failed to locate \(file) in bundle.")
                }
        guard let data = try? Data(contentsOf: url) else {
                    fatalError("Failed to load \(file) from bundle.")
                }
        do {
            let decoder = JSONDecoder()
            try liveData = decoder.decode(LiveDataModel.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(file) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
