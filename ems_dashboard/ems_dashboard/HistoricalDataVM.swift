//
//  HistoricalDataVM.swift
//  ems_dashboard
//
//  Created by MAC on 21/05/2022.
//

import Foundation

final class HistoricalDataViewModel: ObservableObject {
    @Published var samples = [HistoricalDataSample]()
    
    init() {
        let file = "historic_data"
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        do {
            let decoder = JSONDecoder()
            try samples = decoder.decode([HistoricalDataSample].self, from: data)
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
    
    func getReducedSamples(reduced by: Int) -> [HistoricalDataSample] {
        var result: [HistoricalDataSample] = []
        for (idx, sample) in self.samples.enumerated() {
            if idx % by == 0 {
                result.append(sample)
            }
            
        }
        return result
    }
    
    enum sampleType {
        case building_active_power
        case grid_active_power
        case pv_active_power
        case quasars_active_power
        
    }
    
    func getReducedSampleValues(reduced by: Int, by type: sampleType) -> [Double] {
        var result: [Double] = []
        for (idx, sample) in self.samples.enumerated() {
            if idx % by == 0 {
                switch type {
                case .building_active_power:
                    result.append(Double(sample.building_active_power))
                case .grid_active_power:
                    result.append(Double(sample.grid_active_power))
                case .pv_active_power:
                    result.append(Double(sample.pv_active_power))
                case .quasars_active_power:
                    result.append(Double(sample.quasars_active_power))
                }
            }
            
        }
        return result
    }
    
}
