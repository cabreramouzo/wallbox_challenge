//
//  ContentView.swift
//  ems_dashboard
//
//  Created by MAC on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var liveDataVM: LiveDataViewModel
    @StateObject var HistoricalDataVM = HistoricalDataViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Quasar Energy")) {
                        HStack {
                            VStack {
                                Text(String(liveDataVM.liveData.quasars_power))
                                Text("Charged")
                            }
                            Spacer()
                            VStack {
                                Text(String(liveDataVM.liveData.quasars_power))
                                Text("Discharged")
                            }
                            
                        }
                    }
                    
                    Section(header: Text("Live data")) {
                        HStack {
                            VStack {
                                Text(String(liveDataVM.liveData.solar_power))
                                Text("Solar Power")
                            }
                            Spacer()
                            VStack {
                                Text(String(liveDataVM.liveData.quasars_power))
                                Text("Quasar Power")
                            }
                            
                        }
                        HStack {
                            VStack {
                                Text(String(liveDataVM.liveData.grid_power))
                                Text("Grid")
                            }
                            Spacer()
                            VStack {
                                Text(String(liveDataVM.liveData.system_soc))
                                Text("System soc")
                            }
                            
                        }
                        HStack {
                            VStack {
                                Text("3.45 Kwh")
                                Text("Total Energy")
                            }
                            Spacer()
                            VStack {
                                Text("3.45 Kwh")
                                Text("Current Energy")
                            }
                            
                        }
                    }
                    
                    Section(header: Text("Statistics")) {
                        NavigationLink(
                            destination: detailView(
                                samples_building: HistoricalDataVM.getReducedSampleValues(reduced: 10, by: .building_active_power),
                                samples_grid: HistoricalDataVM.getReducedSampleValues(reduced: 10, by: .grid_active_power),
                                samples_pv: HistoricalDataVM.getReducedSampleValues(reduced: 10, by: .pv_active_power),
                                samples_quasars: HistoricalDataVM.getReducedSampleValues(reduced: 10, by: .quasars_active_power)),
                            label: {
                                Text("View chart details")
                            })
                            .navigationTitle(Text("View charts"))
                        HStack {
                            VStack {
                                Text("3.45 Kwh")
                                Text("Solar Power")
                            }
                            Spacer()
                            VStack {
                                Text("3.45 Kwh")
                                Text("Quasar Power")
                            }
                            
                        }
                        HStack {
                            VStack {
                                Text("3.45 Kwh")
                                Text("Grid")
                            }
                            Spacer()
                            VStack {
                                Text("3.45 Kwh")
                                Text("System soc")
                            }
                        }
                        HStack {
                            VStack {
                                Text("3.45 Kwh")
                                Text("Total Energy")
                            }
                            Spacer()
                            VStack {
                                Text("3.45 Kwh")
                                Text("Current Energy")
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
