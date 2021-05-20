//
//  BtnMetrics.swift
//  cat-fact-rra-swift
//
//  Created by Rafael Rodriguez on 5/18/21.
//

import SwiftUI

struct BtnMetrics<Destination : View>: View {
    var destination:  Destination
    
    var body: some View {
        NavigationLink(destination: self.destination) { Image(systemName: "gauge") }
    }
}

struct BtnMetrics_Previews: PreviewProvider {
    static var previews: some View {
        BtnMetrics(destination: Metrics())
    }
}
