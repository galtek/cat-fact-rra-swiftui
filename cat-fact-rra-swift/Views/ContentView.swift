//
//  ContentView.swift
//  cat-fact-rra-swift
//
//  Created by Rafael Rodriguez on 5/16/21.
//

import SwiftUI

struct ContentView: View {
//    var cats: [Cat] = TestData.getCatsCpl()//for testing
    @ObservedObject var catNetAPI = CatNetAPI()
    
    var body: some View {
        NavigationView {
            
            if (catNetAPI.isProcessing) {
                VStack{
                    Text("Loading...")
                }
            } else {
//                List(cats) { cat in//for testing
                List(catNetAPI.cats){ cat in
                    NavigationLink(destination: CatDetail(cat: cat) ) {
                        CatRow(cat: cat)
                    }
                }
                .navigationTitle("Cat List")
                .navigationBarItems(trailing: HStack { BtnMetrics(destination: Metrics()) } )
                
            }
            

            
            
        }
        
    }
}
//for testing in
//NavigationLink( destination: Text(cat.breed) ) {
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
