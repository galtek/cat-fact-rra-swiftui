//
//  CatRow.swift
//  cat-fact-rra-swift
//
//  Created by Rafael Rodriguez on 5/17/21.
//

import SwiftUI

struct CatRow: View {
    
    var cat: Cat
    var body: some View {
        HStack{
            Image(systemName: "photo")
            VStack(alignment: .leading) {
                Text(cat.breed)
                Text(cat.country)
                    .font(.subheadline)
            }
        }
    }
}

struct CatRow_Previews: PreviewProvider {
//    var cats: [Cat] = TestData.getCats()
    static var previews: some View {
        let cats: [Cat] = TestData.getCats()
        CatRow(cat: cats[0])
    }
}
