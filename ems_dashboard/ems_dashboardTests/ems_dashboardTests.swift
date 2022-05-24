//
//  ems_dashboardTests.swift
//  ems_dashboardTests
//
//  Created by MAC on 20/05/2022.
//

import XCTest
@testable import ems_dashboard

class ems_dashboardTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetReducedSamples() throws {
                
        let s1 = HistoricalDataSample(building_active_power: 1.2, grid_active_power: 2.3, pv_active_power: 3.4, quasars_active_power: 4.5, timestamp: "")
        
        let array = [s1,s1,s1,s1,s1,s1,s1,s1,s1,s1]
        let vm = HistoricalDataViewModel(samples: array)
        
        let result = vm.getReducedSamples(reduced: 3)
        
        assert(type(of: result) == [HistoricalDataSample].self)
        assert(result.count == 3)
    }
    
    func testGetReducedSampleValues() throws {
        let s1 = HistoricalDataSample(building_active_power: 1.2, grid_active_power: 2.3, pv_active_power: 3.4, quasars_active_power: 4.5, timestamp: "")
        
        let array = [s1,s1,s1,s1,s1,s1,s1,s1,s1,s1]
        let vm = HistoricalDataViewModel(samples: array)
        
        let result = vm.getReducedSampleValues(reduced: -1, by: .building_active_power)
        
        assert(type(of: result) == [Double].self)
        assert(result.count == 10)
        for value in result {
            assert(String(format: "%.1f", value) == "1.2")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
