//
//  detailView.swift
//  ems_dashboard
//
//  Created by MAC on 20/05/2022.
//

import SwiftUI

struct detailView: View {
    var body: some View {
        Form {
            Section(header: Text("Energy Chart")) {
                VStack {
                    VStack {
                        Image(systemName: "chart.bar.fill")
                            .resizable()
                            .scaledToFit()
                    }
                    Spacer()
                    HStack {
                        VStack(alignment: .leading) {
                            Label(
                                title: { Text("Building").font(.callout) },
                                icon: { Image(systemName: "circle.fill").accentColor(.blue)}
                            )
                            Spacer()
                            Label(
                                title: { Text("Grid") },
                                icon: { Image(systemName: "circle.fill").accentColor(.red)}
                            )
                        }
                        Spacer()
                        VStack(alignment:.leading) {
                            Label(
                                title: { Text("PV") },
                                icon: { Image(systemName: "circle.fill").accentColor(.orange)}
                            )
                            Spacer()
                            Label(
                                title: { Text("Quasars") },
                                icon: { Image(systemName: "circle.fill").accentColor(.green)}
                            )
                        }
                    }
                    
                }
            }
        }
    }
}

struct detailView_Previews: PreviewProvider {
    static var previews: some View {
        detailView()
    }
}
