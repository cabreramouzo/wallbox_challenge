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
    
    var body: some View {

        ScrollView {
            LineView(data: samples_building, title: "Building").padding().frame(width: .infinity, height: 300, alignment: .center)
            Spacer().padding(.bottom, 50)
                LineView(data: samples_grid, title: "Grid").padding()
                    .frame(width: .infinity, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer().padding(.bottom, 50)
                LineView(data: samples_pv, title: "PV").padding()
                    .frame(width: .infinity, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer().padding(.bottom, 50)
                LineView(data: samples_quasars, title: "Quasars").padding()
                    .frame(width: .infinity, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer().padding(.bottom, 50)
            MultiLineChartView(data: [
                                (samples_building, GradientColors.green),
                                (samples_grid, GradientColors.purple),
                                (samples_pv, GradientColors.orngPink),
                                (samples_quasars, GradientColors.prplNeon)], title: "All", legend: "", style: ChartStyle(backgroundColor: Color.white, accentColor: Color.black, gradientColor: GradientColors.green, textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.clear), form: ChartForm.large, dropShadow: false)
            Spacer().padding(.bottom, 50)
            
            
            
            
        }
            
        
        
    }
}

struct detailView_Previews: PreviewProvider {
    static var previews: some View {
        detailView(samples_building: [1,2,34,7], samples_grid: [1,2,34,7], samples_pv: [1,2,34,7], samples_quasars: [1,2,34,7])
    }
}
