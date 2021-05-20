//
//  Metrics.swift
//  cat-fact-rra-swift
//
//  Created by Rafael Rodriguez on 5/17/21.
//

import SwiftUI

struct Metrics: View {
    let machine_name = machineName()
    let model_name = UIDevice.modelName
    
    @ObservedObject var catNetAPI = CatNetAPI()
    
    var body: some View {
        VStack{
            Text("Time Loading \(catNetAPI.netLatency)ms")
            Text("Machine Name:")
            Text(machine_name)
            Text("Model Name:")
            Text(model_name)
        }
        
    }
}

struct Metrics_Previews: PreviewProvider {
    static var previews: some View {
        Metrics()
    }
}
