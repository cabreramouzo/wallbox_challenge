//
//  ContentView.swift
//  ems_dashboard
//
//  Created by MAC on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Quasar Energy")) {
                    HStack {
                        VStack {
                            Text("3.45 Kwh")
                            Text("Charged")
                        }
                        Spacer()
                        VStack {
                            Text("3.45 Kwh")
                            Text("Discharged")
                        }
                        
                    }
                }
                
                Section(header: Text("Live data")) {
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
                
                Section(header: Text("Statistics")) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
