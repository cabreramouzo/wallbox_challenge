//
//  ems_dashboardApp.swift
//  ems_dashboard
//
//  Created by MAC on 20/05/2022.
//

import SwiftUI

@main
struct ems_dashboardApp: App {
    @StateObject var viewModel = LiveDataViewModel()
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environmentObject(viewModel)
        }
    }
}
