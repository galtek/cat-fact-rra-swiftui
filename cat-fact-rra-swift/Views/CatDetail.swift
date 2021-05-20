//
//  CatDetail.swift
//  cat-fact-rra-swift
//
//  Created by Rafael Rodriguez on 5/17/21.
//

import SwiftUI

struct CatDetail: View {
    let cat: Cat
    
    var body: some View {
        VStack{
            Text("Country: \(cat.country)")
                .padding()
            if let catOrigin = cat.origin {
                Text(catOrigin)
            }
            if let catCoat = cat.coat {
                Text(catCoat)
            }
            if let catPattern = cat.pattern {
                Text(catPattern)
            }
            Spacer()
            NavigationLink(destination: Metrics()){
                Text("See Metrics")
            }
        }
        .navigationTitle(cat.breed)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CatDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CatDetail(cat: Cat.catExampleCpl)
        }
        
    }
}
