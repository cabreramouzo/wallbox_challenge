//
//  detailView.swift
//  ems_dashboard
//
//  Created by MAC on 20/05/2022.
//

import SwiftUI
import SwiftUICharts

struct detailView: View {
    var samples_building: [Double]
    var samples_grid: [Double]
    var samples_pv: [Double]
    var samples_quasars: [Double]
    
    let chart_style_building = ChartStyle(backgroundColor: Color.white, accentColor: Color.black, gradientColor: GradientColors.green, textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.black)
    let chart_style_grid = ChartStyle(backgroundColor: Color.white, accentColor: Color.black, gradientColor: GradientColors.purple, textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.black)
    let chart_style_pv = ChartStyle(backgroundColor: Color.white, accentColor: Color.black, gradientColor: GradientColors.orngPink, textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.black)
    let chart_style_quasars = ChartStyle(backgroundColor: Color.white, accentColor: Color.black, gradientColor: GradientColors.prplNeon, textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.black)
    
    var body: some View {
        
        List {
            Group {
                LineView(data: samples_building, title: "Building", style: chart_style_building).padding().frame(width: nil, height: 400, alignment: .center)
                Spacer().padding(.bottom, 50)
                LineView(data: samples_grid, title: "Grid", style: chart_style_grid).padding()
                    .frame(width: nil, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer().padding(.bottom, 50)
                LineView(data: samples_pv, title: "PV", style: chart_style_pv).padding()
                    .frame(width: nil, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer().padding(.bottom, 50)
                LineView(data: samples_quasars, title: "Quasars", style: chart_style_quasars).padding()
                    .frame(width: nil, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer().padding(.bottom, 50)
                MultiLineChartView(data: [
                                    (samples_building, GradientColors.green),
                                    (samples_grid, GradientColors.purple),
                                    (samples_pv, GradientColors.orngPink),
                                    (samples_quasars, GradientColors.blue)], title: "All", legend: "", style: ChartStyle(backgroundColor: Color.white, accentColor: Color.black, gradientColor: GradientColors.green, textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.clear), form: ChartForm.large, dropShadow: false)
                    
                Spacer().padding(.bottom, 50)
            }
            Group {
                HStack {
                    VStack(alignment: .leading) {
                        Label(
                            title: { Text("Building").font(.callout) },
                            icon: { Image(systemName: "circle.fill").accentColor(.green)}
                        )
                        Spacer()
                        Label(
                            title: { Text("Grid") },
                            icon: { Image(systemName: "circle.fill").accentColor(.purple)}
                        )
                    }
                    Spacer()
                    VStack(alignment:.leading) {
                        Label(
                            title: { Text("PV") },
                            icon: { Image(systemName: "circle.fill").accentColor(.pink)}
                        )
                        Spacer()
                        Label(
                            title: { Text("Quasars") },
                            icon: { Image(systemName: "circle.fill").accentColor(.blue)}
                        )
                    }
                }
            }
            
        }.navigationTitle(Text("Charts detail"))
    }
}

struct detailView_Previews: PreviewProvider {
    static var previews: some View {
        detailView(samples_building: [1,2,34,7], samples_grid: [1,2,34,7], samples_pv: [1,2,34,7], samples_quasars: [1,2,34,7])
    }
}
