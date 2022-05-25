//
//  ContentView.swift
//  ems_dashboard
//
//  Created by MAC on 20/05/2022.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var liveDataVM: LiveDataViewModel
    @StateObject var HistoricalDataVM = HistoricalDataViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Quasar Energy")) {
                        HStack {
                            if (liveDataVM.liveData.quasars_power > 0) {
                                Image(systemName: "bolt")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40)
                                Text("Charging from the grid...")
                                    .font(.footnote)
                                    .padding(5)
                                Spacer()
                                Text(String(liveDataVM.liveData.quasars_power) + " Kwh")
                                    .accentColor(.green)
                                
                            } else {
                                Image("powerplug")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                Text("Discharging to the building...")
                                    .font(.footnote)
                                    .padding(5)
                                Spacer()
                                Text(String(liveDataVM.liveData.quasars_power) + " Kwh")
                                    .accentColor(.red)
                            }
                        }
                    }
                    
                    Section(header: Text("Live data")) {
                        HStack {
                            VStack {
                                Text(String(liveDataVM.liveData.solar_power) + " Kwh")
                                    .padding(5)
                                Text("Solar Power")
                            }
                            Spacer()
                            VStack {
                                Text(String(liveDataVM.liveData.quasars_power) + " Kwh")
                                    .padding(5)
                                Text("Quasar Power")
                            }
                            
                        }
                        HStack {
                            VStack {
                                Text(String(liveDataVM.liveData.grid_power) + " Kwh")
                                    .padding(5)
                                Text("Grid")
                            }
                            Spacer()
                            VStack {
                                Text(String(format: "%.2f", liveDataVM.liveData.system_soc) + " Kwh")
                                    .padding(5)
                                Text("System soc")
                            }
                            
                        }
                        HStack {
                            VStack {
                                Text(String(liveDataVM.liveData.total_energy) + " Kwh")
                                    .fontWeight(.bold)
                                    .padding(5)
                                Text("Total Energy").fontWeight(.semibold)
                            }
                            Spacer()
                            VStack {
                                Text(String(liveDataVM.liveData.current_energy) + " Kwh")
                                    .fontWeight(.bold)
                                    .padding(5)
                                Text("Current Energy").fontWeight(.semibold)
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
                                
                                HStack {
                                    Text("View chart details")
                                    Image(systemName: "chart.bar.fill")
                                }
                            })
                            .navigationTitle(Text("Dashboard"))
                        HStack {
                            VStack {
                                Text(String(format: "%.0f", (liveDataVM.liveData.solar_power / liveDataVM.liveData.building_demand) * 100 ) + " %").padding(5)
                                Text("Solar Power")
                            }
                            Spacer()
                            VStack {
                                Text(String(format: "%.0f", (abs(liveDataVM.liveData.quasars_power) / liveDataVM.liveData.building_demand) * 100 ) + " %").padding(5)
                                Text("Quasar Power")
                            }
                            
                        }
                        HStack {
                            VStack {
                                Text(String(format: "%.0f", (liveDataVM.liveData.grid_power / liveDataVM.liveData.building_demand) * 100 ) + " %").padding(5)
                                Text("     Grid     ")
                            }
                            Spacer()
                            VStack {
                                Text(String(format: "%.0f", liveDataVM.liveData.system_soc) + " %").padding(5)
                                Text("System SoC status")
                            }
                        }
                        HStack {
                            VStack {
                                Text(String(liveDataVM.liveData.total_energy) + " kwh").padding(5)
                                Text("Total Energy")
                            }
                            Spacer()
                            VStack {
                                Text(String(liveDataVM.liveData.current_energy) + " kwh").padding(5)
                                Text("Current Energy")
                            }
                            
                        }
                    }
                }
            }.navigationBarTitle(Text("Dashboard"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
