//
//  Cat.swift
//  cat-fact-rra-swift
//
//  Created by Rafael Rodriguez on 5/16/21.
//

import Foundation

struct Jsondata: Decodable {
    var current_page: Int
    var data: [CatNoId]
    var first_page_url: String
    var from: Int
    var last_page: Int
    var last_page_url: String
}
struct CatNoId: Decodable {
    
    var breed:      String
    var country:    String
    var origin:     String?
    var coat:       String?
    var pattern:    String?

    
}

struct Cat: Identifiable, Decodable {//
    var id: String = UUID().uuidString
    
    var breed:      String
    var country:    String
    var origin:     String?
    var coat:       String?
    var pattern:    String?

}

extension Cat {
    
    init(_breed: String, _country: String) {
        self.breed = _breed
        self.country = _country
    }
    init(_breed: String, _country: String, _origin: String?, _coat: String?, _pattern: String?) {
        self.breed = _breed
        self.country = _country
        self.origin = _origin
        self.coat = _coat
        self.pattern = _pattern
    }
    
    static let catExample: Cat = Cat(_breed: "Cat Example", _country: "Country Example")
    
    static let catExampleCpl: Cat = Cat(_breed: "Cat Example Cpl", _country: "Country Example Cpl", _origin: "Origin Example Cpl", _coat: "Coat Example Cpl", _pattern: "Pattern Example Cpl")
    
}

struct CatList: Decodable {
    var data: [Cat]
}

struct CatListNoId: Decodable {
    var data: [CatNoId]
}
